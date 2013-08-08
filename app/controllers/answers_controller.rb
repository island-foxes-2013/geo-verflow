class AnswersController < ApplicationController
  def index
    @question = Question.find_by_id(params[:question_id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def create
    question = Question.find_by_id(params[:question_id])
    question.answers.create(content: params[:answer][:content])
    redirect_to question_answers_path(question)
  end
end
