class SessionsController < ApplicationController

  # renders login page
  def new
    @user = User.new
  end

  # creates new session 
  def create
    @user = User.find_by_username(params[:user][:username])
    if @user && @user.password == params[:user][:password]
      session[:user] = @user.id
      redirect_to root_path
    else
      @user = User.new
      flash.now[:error] = 'Invalid email/password'
      render 'new'
    end
  end

  # clears user's session
  def destroy
    session[:user] = nil
    redirect_to root_path
  end

end