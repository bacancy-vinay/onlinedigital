# frozen_string_literal: true

# Sub field controller
class SubFieldsController < ApplicationController
  before_action :find_sub_field, only: %i[edit show update destroy]

  def new
    @sub_field = SubField.new
  end

  def index
    @sub_fields = SubField.all
  end

  def create
    @sub_field = SubField.new(sub_field_params)
    if @sub_field.save!
      redirect_to sub_fields_path, notice: 'successfully created.'
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @sub_field.update(sub_field_params)
      redirect_to sub_fields_path, notice: 'successfully updated.'
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @sub_field.destroy
    redirect_to sub_fields_path, notice: 'successfully destroyed.'
  end

  def subfield
    @main = MainField.where(main_field: params[:main])
    @sub = SubField.where(main_field_id: @main)
  end

  private

  def sub_field_params
    params.require(:sub_field).permit(:sub_field, :main_field_id)
  end

  def find_sub_field
    # @resume = Resume.find(params[:resume_id])
    @sub_field = SubField.find(params[:id])
  end
end
