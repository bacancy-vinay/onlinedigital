# frozen_string_literal: true

# Resume controller
class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resume, only: %i[destroy show]
  before_action :edit_resume, only: %i[edit]
  def new
    @resume = Resume.new
  end

  def index
    if params[:query].present?
      @pagy, @resumes = pagy(Resume.searching(params[:query]), items: 5)
    else
      @pagy, @resumes = pagy(Resume.where(params[:resume_id]), items: 5)
    end
  end

  def create
    @resume = Resume.new
    @resume.user_id = current_user.id
    if @resume.save!
      redirect_to resume_fieldchoices_path(@resume)
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
               orientation: 'Portrait'
      end
    end
  end

  def edit
    redirect_to resume_fieldchoices_path(@resume)
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

  def edit_resume
    @resume = Resume.find(params[:resume_id])
  end

  def find_resume
    @resume = Resume.find(params[:id])
  end
end
