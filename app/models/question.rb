class Question < ActiveRecord::Base
  attr_accessible :title, :content, :upvotes, :downvotes, 
end
