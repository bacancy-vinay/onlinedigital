# frozen_string_literal: true

# fieldchoice controller
class FieldchoicesController < ApplicationController
  before_action :find_fieldchoice, only: %i[edit show update destroy]

  def new
    @resume = Resume.find(params[:resume_id])
    @fieldchoice = Fieldchoice.new(resume_id: @resume.id)
  end

  def index
    @fieldchoices = Fieldchoice.where(resume_id: params[:resume_id])
  end

  def create
    @fieldchoice = Fieldchoice.new(fieldchoice_params)
    @fieldchoice.resume_id = params[:resume_id]

    if @fieldchoice.save!
      redirect_to resume_fieldchoices_path
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @fieldchoice.update(fieldchoice_params)
      redirect_to resume_fieldchoice_path
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @fieldchoice.destroy
    redirect_to resume_fieldchoices_path
  end

  private

  def fieldchoice_params
    params.require(:fieldchoice).permit(:main_field, :sub_field, :exp_year, :exp_month, :resume_id)
  end

  def find_fieldchoice
    @resume = Resume.find(params[:resume_id])
    @fieldchoice = Fieldchoice.find(params[:id])
  end
end
