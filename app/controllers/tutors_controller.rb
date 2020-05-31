class TutorsController < SecureController
    def index
        @tutors = User.all.select{ |tutor| !tutor.tutorCourses.empty?}
    end

    def create_tutor
        user = User.find(params[:user_id])
        course = Course.find(params[:course_id])

        if can_create_tutor?(user, course)
            Teaching.create!(user_id: params[:user_id], course_id: params[:course_id])
            redirect_to action: :index
        else
            redirect_to courses_path, alert: "You cannot get assigned as a tutor for course  #{course.code}!" 
        end
    end

    private

    # Check if the user is already a tutor for the given course
    # Check if the user is a student for the course they are trying to tutor
    def can_create_tutor?(user, course)
        if user.tutorCourses.include?(course) 
            return false
        elsif user.studentCourses.include?(course)
            return false
        else
            return true
        end
    end
end
