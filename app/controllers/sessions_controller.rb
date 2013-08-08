class SessionsController < ApplicationController

  # renders login page
  def new
    @user = User.new
  end

  # creates new session 
  def create
  end

  # clears user's session
  def destroy
  end

end