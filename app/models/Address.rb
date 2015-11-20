class Address < ActiveRecord::Base
  validates :street, :type, :user_id, presence: true
  validates :zip, presence: true, length: {is: 5}
  belongs_to :user
end