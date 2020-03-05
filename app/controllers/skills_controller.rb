# frozen_string_literal: true

# skill controller
class SkillsController < ApplicationController
  before_action :find_skill, only: %i[edit show update destroy]

  def new
    @resume = Resume.find(params[:resume_id])
    @skill = Skill.new(resume_id: @resume.id)
  end

  def index
    @skills = Skill.where(resume_id: params[:resume_id])
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.resume_id = params[:resume_id]
    if @skill.save!
      redirect_to resume_skills_path
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @skill.update(skill_params)
      redirect_to resume_skills_path
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @skill.destroy
    redirect_to resume_skills_path
  end

  private

  def skill_params
    params.require(:skill).permit(:skill_list, :rating, :resume_id)
  end

  def find_skill
    @resume = Resume.find(params[:resume_id])
    @skill = Skill.find(params[:id])
  end
end
