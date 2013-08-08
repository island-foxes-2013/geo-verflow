class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(params[:question])
    if @question.save
      redirect_to questions_path
    else
      flash.now[:error] = "Invalid Title/Content"
      render 'new'
    end
  end
end
