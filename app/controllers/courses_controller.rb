class CoursesController < SecureController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
    
  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.create
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
      @course =  Courses.build(course_params)
      if @course.save
        redirect_to courses_path, notice: 'Course was successfully created.' 
      else
        render courses_url, alert: "Can't create this course." 
      end
  end

  # PATCH/PUT /courses/1
  def update
      if @course.update(course_params)
        redirect_to @course, notice: 'Course was successfully updated.' 
      else
        @course.destroy!
        redirect_to courses_path, alert: "Can't create this course code is not unique." 
      end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.' 
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:code, :name)
    end
end