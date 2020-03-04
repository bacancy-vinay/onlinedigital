# frozen_string_literal: true

# Education controller
class EducationsController < ApplicationController
  before_action :find_education, only: %i[edit show update destroy]

  def new
    @resume =  Resume.find(params[:resume_id])
    @education = Education.new(resume_id: @resume.id)
  end

  def index
    @educations = Education.where(resume_id: params[:resume_id])
  end

  def create
    @education = Education.new(education_params)
    @education.resume_id = params[:resume_id]
    if @education.save!
      redirect_to resume_educations_path 
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @education.update(education_params)
      redirect_to resume_educations_path
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @education.destroy
    redirect_to resume_educations_path
  end

  private

  def education_params
    params.require(:education).permit(:name, :board, :degree, :cource, :graduation_status, :pass_year, :city, :state, :country, :result, :resume_id)
  end

  def find_education
    @resume = Resume.find(params[:resume_id])
    @education = Education.find(params[:id])
  end
end
