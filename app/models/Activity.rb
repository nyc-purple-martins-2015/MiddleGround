class Activity < ActiveRecord::Base
  validates :address, :title, presence: true
  validates :creator_id, :friend_id, presence: true
  belongs_to :creator, class_name: 'User'
  belongs_to :friend, class_name: 'User'

<<<<<<< 36d9df095939915538a13d8846ebbd19c17d2736

  acts_as_mappable :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :long
   attr_accessor :address, :lat, :long

=======
   attr_accessor :address, :lat, :long
>>>>>>> Take out trial js code
end
