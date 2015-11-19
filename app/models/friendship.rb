class Friendship < ActiveRecord::Base
validates :requestor_id, :acceptor_id, presence: true
belongs_to :requestor, class_name: 'User'
belongs_to :acceptor, class_name: 'User'
end