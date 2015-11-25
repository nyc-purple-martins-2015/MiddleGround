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
    sql1 = self.accepted_friends.where('friendships.pending = ?', 0).to_sql
    sql2 = self.requested_friends.where('friendships.pending = ?', 0).to_sql
    sql = " (( #{sql1} ) union all ( #{sql2} ) ) as users"
    User.from(sql)
  end

  def activities
    created = self.created_activities.to_sql
    friend = self.friend_activities.to_sql
    sql = " (( #{created} ) union all ( #{friend} ) ) as activities"
    Activity.from(sql)
  end

  def pending_friendships
    self.accepted_friendships.where(pending: 1)
  end

  def potential_friends
    User.all.select { |user| (!user.friends.include?(self) && user != @user) }.map { |user| [user.username, user.id]}
  end
end


