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

  def upvote
    answer = Answer.find(params[:id])
    vote = answer.votes.new(user: current_user)
    if vote.save
      answer.increment_upvote!
    end
    render json: { votes: answer.vote_count }
  end

  def downvote
    answer = Answer.find(params[:id])
    vote = answer.votes.new(user: current_user)
    if vote.save
      answer.increment_downvote!
    end
    render json: { votes: answer.vote_count }
  end
end
