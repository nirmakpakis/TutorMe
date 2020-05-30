class TutorsController < SecureController
    def index
        @tutors = User.all.select{ |tutor| !tutor.tutorCourses.empty?}
    end

    def create_tutor
        Teaching.create!(user_id: params[:user_id], course_id: params[:course_id])
        redirect_to action: :index
    end
end
