# frozen_string_literal: true

# Business Controller
class BusinessesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_business, only: %i[edit show update destroy]
  def new
    @business = Business.new
  end

  def index
    if params[:query].present?
      @pagy, @businesses = pagy(Business.searching(params[:query]), items: 5)
    else
      @pagy, @businesses = pagy(Business.all, items: 5)
    end
  end

  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id
    if @business.save!
      redirect_to businesses_path, notice: 'successfully created.'
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @business.update(business_params)
      redirect_to businesses_path, notice: 'successfully updated.'
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @business.destroy!
    redirect_to businesses_path, notice: 'successfully destroyed.'
  end

  private

  def business_params
    params.require(:business).permit(
      :title, :owner_name, :owner_post, :country, :info, :address1,
      :address2, :city, :state, :email, :pincode, :facebook, :add_info_info,
      :instagram, :contact_no, :add_info_title,
      images: [],
      contacts_attributes: %i[id contact_no],
      owners_attributes: %i[id owner_name owner_post _destroy],
      addresses_attributes: %i[id address1 state address2 city country pincode]
    )
  end

  def find_business
    @business = Business.find(params[:id])
  end
end
