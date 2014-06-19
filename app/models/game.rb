class Game < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :title, :description, :controls, :flash_file, :image, :developer_name, :height, :width, :category_ids, :featured, :daily_plays, :weekly_plays, :monthly_plays, :sequel_ids
  mount_uploader :flash_file, GameUploader
  dragonfly_accessor :image

  belongs_to :developer
  has_many :game_categories
  has_many :categories, through: :game_categories
  has_many :reputations
  has_many :featured_category_games
  has_many :game_sequels
  has_many :sequels, through: :game_sequels
  has_many :comments
  has_many :game_users
  has_many :users, through: :game_users
  has_many :recommendations
  has_many :recommends, through: :recommendations
  has_one :featured_category_game

  validates_presence_of :height, :width, :title

  def to_param
  	"#{id} #{title}".parameterize
  end

  def developer_name
    developer.try(:name)
  end
  
  def developer_name=(name)
    self.developer = Developer.find_or_create_by_name!(name) if name.present?
  end

  def to_autocomplete_hash
    {value: game_url(self), label: self.title}
  end

  def flash_file_name
  	File.basename(flash_file.path || flash_file.filename) if flash_file
  end

  def create_or_update_reputation(val, user)
    votes = self.reputations
    if votes.present? && votes.map(&:user_id).include?(user.id)
      updatable_vote = votes.where(user_id: user.id).first
      updatable_vote.value = val
      updatable_vote.save!
    else
      new_vote = self.reputations.build(user_id: user.id, value: val)
      new_vote.save!
    end
  end

  def generate_reputation_percentages(reps)
    rep_counts = reps.size
    positive_votes = reps.where(value: 1).size
    first_percentage = ((positive_votes.to_f / rep_counts) * 100).round(3)
    second_percentage = (100 - first_percentage)
    percentage = [first_percentage, second_percentage]

    return percentage
  end

  def self.search(term)
    if term
      where('lower(title) LIKE ?', "%#{term.downcase.gsub(' ', '%')}%")
    else
      scoped
    end    
  end

  def increment_plays!(columns)
    if columns.include?(:all)
      columns = [:plays, :daily_plays, :weekly_plays, :monthly_plays]
    end
    columns.each do |col|
      self[col]= self[col] + 1
    end
    self.save!
  end

  def self.reset_game_plays
    yesterday = Time.now.in_time_zone('Central Time (US & Canada)').to_date.prev_day
    last_of_month = yesterday.end_of_month
    last_of_week = yesterday.end_of_week

    if (yesterday == last_of_month) && (yesterday == last_of_week)
      attrs = {monthly_plays: 0, weekly_plays: 0, daily_plays: 0}
    elsif yesterday == last_of_month
      attrs = {monthly_plays: 0, daily_plays: 0}
    elsif yesterday == last_of_week
      attrs = {weekly_plays: 0, daily_plays: 0}
    else
      attrs = {daily_plays: 0}
    end

    self.find_in_batches do |games|
      games.each do |game|
        game.update_attributes(attrs)
      end
    end  
  end

  def record_user_game_view_for(user)
    if user.present?
      view = GameUser.new(user_id: user.id, game_id: self.id)
     
      user.game_users.where(game_id: self.id).destroy_all unless view.valid?
      
      view.save
    end
  end

  def parsed_controls
    string = self.controls

    nav = "<div class='wasd'>
            <span>W</span><br/>
            <span>A</span><span>S</span><span>D</span>
          </div>"

    arrows = "<div class='arrows'>
                <span>&#8593;</span><br/>
                <span>&#8592;</span><span>&#8595;</span><span>&#8594;</span>
              </div>"

    mouse = "<span class='mouse'></span>"

    space = "<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp</pre>"
   
    controls = string.
               gsub("<nav>", nav).
               gsub("<mouse>", mouse).
               gsub("<arrows>", arrows).
               gsub("<space>", space).
               html_safe
    return controls
  end

  def find_recommendations
    reps = self.reputations.positive_reps.last(50)

    if reps.present?
      user_reps = reps.
        map{|rep| 
          rep.user.reputations.
          find(:all, limit: 20, conditions: ["value = ? AND game_id != ?", 1, self.id])
        }.flatten

      if user_reps.present?
        grouped_reps = user_reps.group_by(&:game).sort_by{|k,v| v.size}.last(10)

        recommended_games = []
        grouped_reps.each do |k,v|
          recommended_games << k
        end
        return recommended_games.reverse
      else
        false
      end
    else
      false
    end
  end
end
