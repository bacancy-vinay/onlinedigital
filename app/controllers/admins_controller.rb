# frozen_string_literal: true

# Admin contoller
class AdminsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @resumes = Resume.all
  end
end
