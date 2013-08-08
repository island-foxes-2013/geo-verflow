class Answer < ActiveRecord::Base
  attr_accessible :content, :downvotes, :upvotes

  belongs_to :question
  has_many :comments

  before_create :default_votes

  validates_presence_of :content

  def default_votes
    self.upvotes = 0
    self.downvotes = 0
  end

  def increment_upvote
    self.upvotes += 1
  end

  def increment_downvote
    self.downvotes += 1
  end
end
