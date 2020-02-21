# frozen_string_literal: true

# Business Controller
class BusinessesController < ApplicationController
  def index
    @business = Business.all
  end
end
