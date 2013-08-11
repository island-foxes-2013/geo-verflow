class QuestionsController < ApplicationController
  def index
    @questions = Question.find(:all, order: "vote_count DESC")
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

  def upvote
    question = Question.find(params[:id])
    vote = question.votes.new(user: current_user)
    if vote.save
      question.increment_upvote!
    end
    render json: { votes: question.vote_count }
  end

  def downvote
    question = Question.find(params[:id])
    vote = question.votes.new(user: current_user)
    if vote.save
      question.increment_downvote!
    end
    render json: { votes: question.vote_count }
  end
end
