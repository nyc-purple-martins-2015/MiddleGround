class Vote < ActiveRecord::Base
validates :user_id, :activity_id, :value, presence: true
end