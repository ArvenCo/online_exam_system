class Instructor::SubjectController < ApplicationController
    def index
        @new_subject = Subject.new
        @subjects = Subject.order(:name)
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
            if @user
                if @student = Student.find_by(user_id: @user.id)
                    redirect_to student_subject_index_path
                elsif @instructor = Instructor.find_by(user_id: @user.id)
                end
            else
                redirect_to sign_up_path, notice: 'user not found'
            end
        else
            redirect_to sign_up_path
        end
    end

    def create
        @instructor = Instructor.find_by(user_id: session[:user_id])
        if @instructor.present?
            @subject = Subject.new(instructor_id: @instructor.id, name: params[:name])
            @subject.save
            redirect_to root_path
        else
            flash[:notice] = "Instructor not exists"
        end
    end

    

end