class SignUp::InstructorController < ApplicationController
    
    def new
        @user = User.new
    end
    def create
    end

end