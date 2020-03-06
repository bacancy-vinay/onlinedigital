# frozen_string_literal: true

# Business Controller
class BusinessesController < ApplicationController
  before_action :find_business, only: %i[edit show update destroy]
  def new
    @business = Business.new
  end

  def index
    @businesses = Business.where(params[:business_id])
  end

  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id

    if @business.save!
      redirect_to businesses_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @business.update(business_params)
      redirect_to businesses_path
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @business.destroy!
    redirect_to businesses_path
  end

  private

  def business_params
    params.require(:business).permit(:title, :owner_name, :owner_post, :info, :address1, :address2, :city, :state, :country, :pincode, :email, :facebook, :instagram, :business_pan, :contact_no, :add_info_title, :add_info_info)
  end

  def find_business
    @business = Business.find(params[:id])
  end
end
