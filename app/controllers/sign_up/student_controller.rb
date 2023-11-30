class SignUp::StudentController < ApplicationController
    def new
        @user = User.new
    end
    
    
end
