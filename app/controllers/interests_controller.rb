# frozen_string_literal: true

# interest controller
class InterestsController < ApplicationController
  before_action :find_interest, only: %i[edit show update destroy]

  def new
    @resume = Resume.find(params[:resume_id])
    @interest = Interest.new(resume_id: @resume.id)
  end

  def index
    @interests = Interest.where(resume_id: params[:resume_id])
  end

  def create
    @interest = Interest.new(interest_params)
    @interest.resume_id = params[:resume_id]
    if @interest.save!
      redirect_to resume_interests_path
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @interest.update(interest_params)
      redirect_to resume_interests_path
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @interest.destroy
    redirect_to resume_interests_path
  end

  private

  def interest_params
    params.require(:interest).permit(:interest_list,:resume_id)
  end

  def find_interest
    @resume = Resume.find(params[:resume_id])
    @interest = Interest.find(params[:id])
  end
end
