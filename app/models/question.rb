class Question < ActiveRecord::Base
  attr_accessible :content, :downvotes, :references, :title, :upvotes
end
