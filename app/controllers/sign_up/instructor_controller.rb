class SignUp::InstructorController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @instructor = Instructor.create(user_id: @user.id)
            session[:user_id] = @user.id
            session[:instructor_id] = @instructor.id
            
        else
            render:new
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

end