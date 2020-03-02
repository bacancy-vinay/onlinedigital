# frozen_string_literal: true

# contact controller
class ContactsController < ApplicationController
  before_action :find_contact, only: %i[edit show update destroy]

  def new
    @contact = Contact.new
  end

  def index
    @contact = Contact.all
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.resume_id = params[:resume_id]
    if @contact.save!
      redirect_to @contact
    else
      redirect_to 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @contact.update(contact_params)
      redirect_to @resume
    else
      resirect_to 'edit'
    end
  end

  def destroy
    @contact.destroy
    redirect_to resume_contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_no, :resume_id, :business_id)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end
end
