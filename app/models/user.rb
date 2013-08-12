class User < ActiveRecord::Base
  attr_accessible :password, :username, :geotag
  validates :username, :password, presence: true
  validates_uniqueness_of :username

  # TODO-JW: check out 'has_one' instead of 'belongs_to' for :geotag
  belongs_to :geotag
  has_many :questions
  has_many :comments
  has_many :answers
  #has_many :geotags
end
