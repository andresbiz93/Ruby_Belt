class UsersController < ApplicationController
    skip_before_action :require_login, only: [:create]

    def create
        new_user = User.create(user_params)
        if new_user.valid?
            session[:user_id] = new_user.id
            redirect_to "/songs" 
        else
            flash[:errors] = new_user.errors.full_messages
            redirect_to "/main"
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            @entries = Entry.order(number: :desc).where(user:@user)
        else
            flash[:errors] = ["No user found"]
            redirect_to "/songs"
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
    end
end
