class SessionsController < ApplicationController
    skip_before_action :require_login, except: [:destroy]
    
    def index
        if(session[:user_id] != nil)
            session[:user_id] = nil
        end
    end

    def create
        user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
        if user
          session[:user_id] = user.id
          redirect_to "/songs"
        else
          flash[:errors] = ["Email/password combination is invalid"]
          redirect_to "/main"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to "/main"
    end
end
