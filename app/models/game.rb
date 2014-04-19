class Game < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :title, :description, :controls, :flash_file, :image, :developer_id, :height, :width, :category_ids, :featured
  mount_uploader :flash_file, GameUploader
  dragonfly_accessor :image

  belongs_to :developer
  has_many :game_categories
  has_many :categories, through: :game_categories
  has_many :reputations
  has_many :featured_category_games
  has_many :comments
  has_one :featured_category_game

  validates_presence_of :height, :width, :title

  def to_param
  	"#{id} #{title}".parameterize
  end

  def to_autocomplete_hash
    {value: game_path(self), label: self.title}
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
      Game.delay.update_all([monthly_plays: 0, weekly_plays: 0, daily_plays: 0])
    elsif yesterday == last_of_month
      Game.delay.update_all([monthly_plays: 0, daily_plays: 0])
    elsif yesterday == last_of_week
      Game.delay.update_all([weekly_plays: 0, daily_plays: 0])
    else
      Game.delay.update_all([daily_plays: 0])
    end
  end
end
