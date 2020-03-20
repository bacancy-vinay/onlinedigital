# frozen_string_literal: true

# cities-dropdown Controller
class CitiesController < ApplicationController
  def address_city
    @cities = CS.get(params[:country], params[:state])
  end

  def education_city
    @edu_cities = CS.get(params[:country], params[:state])
  end

  def experience_city
    @exp_cities = CS.get(params[:country], params[:state])
  end
end
