class Activity < ActiveRecord::Base
  validates :location, :title, presence: true
  validates :creator_id, :friend_id, presence: true
  belongs_to :creator, class_name: 'User'
  belongs_to :friend, class_name: 'User'
  has_many :votes

  def self.filter_categories(category)
    category.map {|category_filter| [category_filter["title"], category_filter["alias"]]}
  end

  def rated_by_user(user)
      self.votes.where(user_id: user.id).empty?
  end

end
