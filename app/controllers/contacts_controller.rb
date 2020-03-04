# frozen_string_literal: true

# contact controller
class ContactsController < ApplicationController
  before_action :find_contact, only: %i[edit show update destroy]

  def new
    @resume =  Resume.find(params[:resume_id])
    @contact = Contact.new(resume_id: @resume.id)
  end

  def index
    @contacts = Contact.where(resume_id: params[:resume_id])
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.resume_id = params[:resume_id]
    if @contact.save!
      redirect_to resume_contacts_path
    else
      redirect_to 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @contact.update(contact_params)
      redirect_to resume_contact_path
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
    
    @resume = Resume.find(params[:resume_id])
    @contact = Contact.find(params[:id])
  end
end
