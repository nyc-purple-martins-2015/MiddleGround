class Friendship < ActiveRecord::Base
  #prefer validating object to validating id
  validates :requester, :acceptor, presence: true
  belongs_to :requester, class_name: 'User'
  belongs_to :acceptor, class_name: 'User'
end
