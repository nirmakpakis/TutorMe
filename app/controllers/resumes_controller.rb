class ResumesController < SecureController
   
   # inspired from: https://www.tutorialspoint.com/ruby-on-rails/rails-file-uploading.htm

  def index
     @resumes = Resume.all.select{|resume| resume.user_id == current_user.id}
  end
  
  def new
     @resume = Resume.new
  end
  
  def create
     @resume = Resume.new(resume_params)
     @resume.user = current_user

     if @resume.save
        redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded to user #{current_user.email.split('@')[0]}."
     else
        redirect_to resumes_path, alert: "Failed to save resume"
     end
  end
  
  def destroy
     @resume = Resume.find(params[:id])
     @resume.destroy
     redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
  end
  
  private
     def resume_params
     params.require(:resume).permit(:name, :attachment)
  end
end