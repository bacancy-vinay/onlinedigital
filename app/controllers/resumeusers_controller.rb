class ResumeusersController < ApplicationController
  before_action :find_resumeuser, only: %i[edit show update destroy]

  def new
    @resumeuser = Resumeuser.new
    @resumeuser.resume_id =  params[:resume_id]
  end
  def create
    @resumeuser = Resumeuser.new(resumeuser_params)
    if @resumeuser.save!
      redirect_to new_address_path(resumeuser_id: @resumeuser.id)
    else
      render 'new'
    end
  end

  def index
    @resumeuser =  Resumeuser.all
  end

  def show
  end

  def edit
  end
  def update
    if @resumeuser.update(resumeuser_params)
      redirect_to @resumeuser
    else
      redirect_to 'edit'
    end
  end
  
  def destroy
    @resumeuser.destroy
    redirect_to resumeusers_path
  end

  private

  def resumeuser_params
    params.require(:resumeuser).permit(:prefix, :first_name, :last_name, :email, :website, :linkedin, :birthdate, :resume_id)
  end

  def find_resumeuser
    @resumeuser = Resumeuser.find(params[:id])
  end
end
