class ResumesController < ApplicationController
  before_action :find_resume, only: [:edit, :show, :update ,:destroy]
	def new
		@resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user_id=current_user.id
    if@resume.save!
      
      # redirect_to @resume
      redirect_to new_address_path(:resume_id => @resume.id)
    else
      render 'new'
    end
  end

  def show 

  end

  def index
    @resume = Resume.all
  end

  def edit
  end
  
  def update
    if @resume.update(resume_params)
      redirect_to @resume
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @resume.destroy
      redirect_to resumes_path
  end

  private

  def resume_params
    params.require(:resume).permit(:prefix,:first_name,:last_name,:email,:website,:linkedin,:birthdate,:user_id)
  end

  def find_resume
    @resume = Resume.find(params[:id])
  end

end
