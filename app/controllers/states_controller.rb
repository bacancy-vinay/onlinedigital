# frozen_string_literal: true

# state dropdown
class StatesController < ApplicationController
  def index
    @states = CS.states(params[:country])
  end
end
