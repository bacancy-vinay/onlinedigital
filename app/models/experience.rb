# frozen_string_literal: true

# Experience Model
class Experience < ApplicationRecord
  belongs_to :resume
  EXPTYPE = %w[Internship Job].freeze
end
