class UsersController < ApplicationController

  def new
    @user = User.new    
  end

  def show
  end

  def create
    @geotag_obj = Geotag.find_or_create_by_city_name(params[:user][:geotag_id])
    @user = User.new(username: params[:user][:username], password: params[:user][:password])
    if @user.save
      @user.update_attribute(:geotag, @geotag_obj)
      session[:user] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid username/password"
      render 'new'
    end
  end

end