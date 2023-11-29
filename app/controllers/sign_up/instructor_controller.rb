class InstructorController < ApplicationController
    
    def new
        @user = User.new
    end
    
end