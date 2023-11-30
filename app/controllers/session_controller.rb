class SessionController < ApplicationController

    # @login view
    def new
        if session[:user_id]
            user = User.find_by_id(session[:user_id])
            if user.present?
                redirect_to root_path
            end
        end
    end
    
    def create
        @user = User.find_by(username: params[:username])
        if @user.present? && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:alert] = "Invalid access"
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to sign_up_path
    end
    
end
