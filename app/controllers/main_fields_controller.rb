# frozen_string_literal: true

# main field controller
class MainFieldsController < ApplicationController
  before_action :find_main_field, only: %i[edit show update destroy]

  def new
    # @resume = Resume.find(params[:resume_id])
    # @main_field = main_field.new(resume_id: @resume.id)
    @main_field = MainField.new
  end

  def index
    # @main_fields = main_field.where(resume_id: params[:resume_id])
    @main_fields = MainField.all
  end

  def create
    @main_field = MainField.new(main_field_params)
    # @main_field.resume_id = params[:resume_id]
    if @main_field.save!
      redirect_to main_fields_path
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @main_field.update(main_field_params)
      redirect_to main_fields_path
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @main_field.destroy
    redirect_to main_fields_path
  end

  private

  def main_field_params
    params.require(:main_field).permit(:main_field)
  end

  def find_main_field
    # @resume = Resume.find(params[:resume_id])
    @main_field = MainField.find(params[:id])
  end
end
