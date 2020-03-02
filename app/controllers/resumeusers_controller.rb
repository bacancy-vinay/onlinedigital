# frozen_string_literal: true

# ResumeUser controller for basic details
class ResumeusersController < ApplicationController
  before_action :find_resumeuser, only: %i[edit show update destroy]

  def new
    @resumeuser = Resumeuser.new
  end

  def index
    @resumeuser = Resumeuser.where(resume_id: params[:resume_id])
  end

  def create
    @resumeuser = Resumeuser.new(resumeuser_params)
    @resumeuser.resume_id = params[:resume_id]

    if @resumeuser.save!
      redirect_to resume_resumeusers_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @resumeuser.update(resumeuser_params)
      redirect_to @resumeuser
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @resumeuser.destroy
    redirect_to resume_resumeusers_path
  end

  private

  def resumeuser_params
    params.require(:resumeuser).permit(:prefix, :first_name, :last_name, :email, :website, :linkedin, :birthdate, :resume_id)
  end

  def find_resumeuser
    @resumeuser = Resumeuser.find(params[:id])
  end
end
