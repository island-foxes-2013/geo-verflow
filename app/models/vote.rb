class Vote < ActiveRecord::Base
  attr_accessible :user, :user_id, :votable_id, :votable_type
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates_uniqueness_of :user_id, scope: [:votable_id, :votable_type]
end
