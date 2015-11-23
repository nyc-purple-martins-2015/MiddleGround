class User < ActiveRecord::Base
  # has_secure_password
  # validates :phone_number, presence: true, :length => { :minimum => 10 }
  validates :username, presence: true
  has_many :requested_friendships, class_name: 'Friendship', foreign_key: :requester_id
  has_many :accepted_friendships, class_name: 'Friendship', foreign_key: :acceptor_id
  has_many :requested_friends, through: :requested_friendships, source: :acceptor
  has_many :accepted_friends, through: :accepted_friendships, source: :requester
  has_many :created_activities, class_name: 'Activity', foreign_key: :creator_id
  has_many :friend_activities, class_name: 'Activity', foreign_key: :friend_id
  has_many :addresses
  has_many :votes

  def friends
    self.accepted_friends.where('friendships.pending = ?', 0) + self.requested_friends.where('friendships.pending = ?', 0)
  end

  def activities
    self.created_activities + self.friend_activities
  end

  def pending_friendships
    self.accepted_friendships.where(pending: 1)
  end
end


