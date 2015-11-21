class Activity < ActiveRecord::Base
  validates :address, :title, presence: true
  validates :creator_id, :friend_id, presence: true
  belongs_to :creator, class_name: 'User'
  belongs_to :friend, class_name: 'User'

   attr_accessor :address, :lat, :long
end
