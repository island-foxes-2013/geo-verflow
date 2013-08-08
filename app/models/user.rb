class User < ActiveRecord::Base
  attr_accessible :password, :username
  validates :username, :password, presence: true
  validates_uniqueness_of :username

  has_many :questions
  has_many :comments
end
