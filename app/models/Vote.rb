class Vote < ActiveRecord::Base
validates :user_id, :activity_id, :value, presence: true
belongs_to :activity
belongs_to :user
end
