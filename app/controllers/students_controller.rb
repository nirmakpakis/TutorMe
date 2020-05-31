class StudentsController < SecureController
    def index
        @students = User.all.select{ |student| !student.studentCourses.empty?}
    end

    def create_student
        user = User.find(params[:user_id])
        course = Course.find(params[:course_id])

        if can_create_student?(user, course)
            Receiving.create!(user_id: params[:user_id], course_id: params[:course_id])
            redirect_to action: :index
        else
            redirect_to courses_path, alert: "You cannot get assigned as a student for course  #{course.code}!"
        end
    end

    # Check if the user is already a student for the given course
    # Check if the user is a tutor for the course they are trying to tutor
    def can_create_student?(user, course)
        if user.studentCourses.include?(course) 
            return false
        elsif user.tutorCourses.include?(course)
            return false
        else
            return true
        end
    end
    
end
