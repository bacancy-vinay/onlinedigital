# frozen_string_literal: true

# Resume controller
class ResumesController < ApplicationController
  before_action :find_resume, only: %i[edit show destroy]
 
  def new
    @resume = Resume.new
  end

  def index
    @resume = Resume.all
  end

  def create
    @resume = Resume.new
    @resume.user_id = current_user.id
    if @resume.save!
      redirect_to edit_resume_path(@resume)
    else
      render 'new'
    end
  end

  def show
    @resumeuser = @resume.resumeuser

  end

  def edit

    @resumeuser = @resume.resumeuser
  end

  def update
    if @resume.update(resume_params)
      redirect_to @resume
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @resume.destroy!
    redirect_to resumes_path
  end

  private

  
  def find_resume
    @resume = Resume.find(params[:id])
  end
end
