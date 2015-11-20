class Friendship < ActiveRecord::Base
validates :requester_id, :acceptor_id, presence: true
belongs_to :requester, class_name: 'User'
belongs_to :acceptor, class_name: 'User'
end
