class SignUp::StudentController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            Student.create(user_id: @user.id)
            redirect_to login_path
        else
            render:new
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

end
