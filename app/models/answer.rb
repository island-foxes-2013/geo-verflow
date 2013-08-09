class Answer < ActiveRecord::Base
  attr_accessible :content, :vote_count

  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  # before_create :default_votes

  validates_presence_of :content

  # def default_votes
  #   self.upvotes = 0
  #   self.downvotes = 0
  # end

  # def increment_upvote
  #   self.votes += 1
  # end

  def increment_upvote!
    self.vote_count += 1
    self.save
  end

  # def increment_downvote
  #   self.votes -= 1
  # end

  def increment_downvote!
    self.vote_count -= 1
    self.save
  end
end
