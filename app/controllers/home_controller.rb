class HomeController < ApplicationController

  def index
    @question = Question.all.sample
  end

end
