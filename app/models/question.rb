class Question < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  # before_create :default_votes

  validates_presence_of :title, :content

  # def default_votes
  #   self.upvotes = 0
  #   self.downvotes = 0
  # end
  
  # def increment_upvote
  #   self.upvotes += 1
  # end

  # def increment_downvote
  #   self.downvotes += 1
  # end
end
