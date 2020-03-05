# frozen_string_literal: true

# About controller
class AboutsController < ApplicationController
  before_action :find_about, only: %i[edit show update destroy]

  def new
    @resume = Resume.find(params[:resume_id])
    @about = About.new(resume_id: @resume.id)
  end

  def index
    @abouts = About.where(resume_id: params[:resume_id])
  end

  def create
    @about = About.new(about_params)
    @about.resume_id = params[:resume_id]
    if @about.save!
      redirect_to resume_abouts_path
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @about.update(about_params)
      redirect_to resume_abouts_path
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @about.destroy
    redirect_to resume_abouts_path
  end

  private

  def about_params
    params.require(:about).permit(:profile, :info, :resume_id)
  end

  def find_about
    @resume = Resume.find(params[:resume_id])
    @about = About.find(params[:id])
  end
end
