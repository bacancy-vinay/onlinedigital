# frozen_string_literal: true

# Admin contoller
class AdminsController < ApplicationController
  def index
    @users = User.all
    @resumes = Resume.all
  end
end
