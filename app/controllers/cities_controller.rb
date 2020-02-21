# frozen_string_literal: true

# cities-dropdown Controller
class CitiesController < ApplicationController
  def index
    @cities = CS.get(params[:country], params[:state])
  end
end
