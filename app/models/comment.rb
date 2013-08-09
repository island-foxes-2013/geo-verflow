class Comment < ActiveRecord::Base
  attr_accessible :content

  validates :content, :commentable_type, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates_presence_of :content
end
