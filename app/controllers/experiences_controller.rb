# frozen_string_literal: true

# Experience Controller which is describe intership or job experience
class ExperiencesController < ApplicationController
  before_action :find_experience, only: %i[edit show update destroy]

  def new
    @resume = Resume.find(params[:resume_id])
    @experience = Experience.new(resume_id: @resume.id)
  end

  def index
    @experiences = Experience.where(resume_id: params[:resume_id])
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.resume_id = params[:resume_id]
    if @experience.save!
      redirect_to resume_experiences_path
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @experience.update(experience_params)
      redirect_to resume_experiences_path
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @experience.destroy
    redirect_to resume_experiences_path
  end

  private

  def experience_params
    params.require(:experience).permit(:exp_type, :name, :start_date, :end_date, :counry, :state, :city, :info )
  end

  def find_experience
    @resume = Resume.find(params[:resume_id])
    @experience = Experience.find(params[:id])
  end
end
