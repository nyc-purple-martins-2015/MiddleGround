class Friendship < ActiveRecord::Base
  validates :requester, :acceptor, presence: true
  belongs_to :requester, class_name: 'User'
  belongs_to :acceptor, class_name: 'User'
end
