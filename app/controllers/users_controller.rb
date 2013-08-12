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
      @user.geotag_id = @geotag_obj.id
      @user.save
      session[:user] = @user.id
      redirect_to root_path
    else
      @user = User.new
      flash.now[:error] = "Invalid username/password"
      render 'new'
    end
  end

end