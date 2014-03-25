class Game < ActiveRecord::Base
  attr_accessible :title, :description, :controls, :play_count, :flash_file, :image, :developer_id, :height, :width
  mount_uploader :flash_file, GameUploader
  dragonfly_accessor :image

  belongs_to :developer
  has_many :categories, through: :game_categories
  has_many :reputations

  validates_presence_of :height, :width, :title

  def to_param
  	"#{id} #{title}".parameterize
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
    rep_counts = reps.length
    positive_votes = reps.where(value: 1).length
    first_percentage = ((positive_votes.to_f / rep_counts) * 100).round(3)
    second_percentage = (100 - first_percentage)
    percentage = [first_percentage, second_percentage]

    return percentage
  end
end
