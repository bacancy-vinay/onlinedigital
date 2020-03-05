# frozen_string_literal: true

# state dropdown
class StatesController < ApplicationController
  def address_state
    @states = CS.states(params[:country])
  end

  def education_state
    @edu_states = CS.states(params[:country])
  end

  def experience_state
    @exp_states = CS.states(params[:country])
  end
end
