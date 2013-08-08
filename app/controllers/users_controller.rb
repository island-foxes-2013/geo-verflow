class UsersController < ApplicationController

  def new
    @user = User.new    
  end

  def show
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user] = @user.id
      redirect_to root_path
    else
      @user = User.new
      flash.now[:error] = "Invalid username/password"
      render 'new'
    end
  end

end