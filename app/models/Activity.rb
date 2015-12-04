# Your file names should be lower case for these models
class Activity < ActiveRecord::Base
  validates :location, :title, presence: true
  validates :creator_id, :friend_id, presence: true
  belongs_to :creator, class_name: 'User'
  belongs_to :friend, class_name: 'User'
  has_many :votes
  # after_create :send_activity_email

  def self.parse_businesses(possible_businesses)
    possible_businesses.map {|business| [business["title"], business["alias"]]}
  end

  def not_yet_rated(user)
    self.votes.where(user_id: user.id).empty?
  end

  def send_activity_email
    ActivityMailer.activity_email(self).deliver_now
  end
end
