class ResumesController < ApplicationController
  before_action :find_resume, only: [:show, :edit, :update]
	def new
		@resumes = Resume.new
  end

  def create
    @resume = Resume(resume_params)
    if@reseme.save
      redirect_to @resume
    else
      render 'new'
    end
  end

  def show 

  end

  def index
  	
  end

  private

  def resume_params
    params.require(:resume).permit(:first_name,:last_name,)
  end

  def find_resume
    @resume = Resume.find(params[:id])
  end

end
