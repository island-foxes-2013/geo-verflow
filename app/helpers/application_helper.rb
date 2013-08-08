module ApplicationHelper

  def current_user
    if session[:user]
      @current_user = User.find(session[:user].to_i)
    else
      nil
    end
  end
end
