# frozen_string_literal: true

# Resume controller
class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resume, only: %i[edit show destroy]
  def new
    @resume = Resume.new
  end

  def index
    @resumes = Resume.where(params[:resume_id])
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
    @about = @resume.about
    @resumeuser = @resume.resumeuser
    @addresses = @resume.addresses
    @educations = @resume.educations
    @experiences = @resume.experiences
    @skills = @resume.skill
    @interests = @resume.interests
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'resumes/show.html.erb',
               pdf: 'try',
               layout: 'pdf.html',
               margin: { top: 0,
                         bottom: 0,
                         left: 0,
                         right: 0 },
               orientation: 'Portrait',
               page_size: "A4"
      end
    end
  end

  def edit
    @about = @resume.about
    @resumeuser = @resume.resumeuser
    @addresses = @resume.addresses
    @educations = @resume.educations
    @experiences = @resume.experiences
    @skills = @resume.skill
    @interests = @resume.interests
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
