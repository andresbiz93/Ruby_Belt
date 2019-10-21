class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  private
  def require_login
    if(session[:user_id] == nil)
      flash[:errors] = ["Please log in."]
      redirect_to "/main"
    end
  end

end
