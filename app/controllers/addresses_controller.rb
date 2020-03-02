# frozen_string_literal: true

# Address Controller
class AddressesController < ApplicationController
  before_action :find_address, only: %i[edit show update destroy]

  def new
    @address = Address.new
  end

  def index
    @address = Address.where(resume_id: params[:resume_id])
  end

  def create
    @address = Address.new(address_params)
    @address.resume_id = params[:resume_id]

    if @address.save!
      redirect_to resume_addresses_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @address.update(address_params)
      redirect_to @address
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @address.destroy
    redirect_to resume_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:address1, :address2, :country, :state, :city, :pincode, :resume_id, :business_id)
  end

  def find_address
    @address = Address.find(params[:id])
  end
end
