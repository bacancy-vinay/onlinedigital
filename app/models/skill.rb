# frozen_string_literal: true

# Skill model
class Skill < ApplicationRecord
  belongs_to :resume
  RATING_LEVEL = %w[20 40 60 80 100].freeze
end
