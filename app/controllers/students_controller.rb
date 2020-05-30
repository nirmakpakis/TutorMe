class StudentsController < SecureController
    def index
        @students = User.all.select{ |student| !student.studentCourses.empty?}
    end

    def create_student
        Receiving.create!(user_id: params[:user_id], course_id: params[:course_id])
        redirect_to action: :index
    end
end
