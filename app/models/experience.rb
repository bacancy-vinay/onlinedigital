# frozen_string_literal: true

# Experience Model
class Experience < ApplicationRecord
  belongs_to :resume
  EXPTYPE = %w[Internship Job].freeze
  validates :exp_type, presence: true
  validates :name, presence: true
  validates :info, presence: true
end
