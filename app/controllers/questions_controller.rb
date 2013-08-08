class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    if current_user
      @question = current_user.questions.new(params[:question])
      if @question.save
        redirect_to questions_path
      else
        flash.now[:error] = "Invalid Title/Content"
        @question = Question.new
        render 'new'
      end
    else
      flash.now[:error] = "Invalid - Must be a logged in user"
      @question = Question.new
      render 'new'
    end
  end
end
