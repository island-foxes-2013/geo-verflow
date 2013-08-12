class Geotag < ActiveRecord::Base
  attr_accessible :city_name, :tag_count
  has_many :users
  has_many :questions
  
  validates :city_name, uniqueness: true, presence: true
  # has_many :questions
end
