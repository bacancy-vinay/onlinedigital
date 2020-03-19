# frozen_string_literal: true

# Experience Model
class Experience < ApplicationRecord
  belongs_to :resume
  EXPTYPE = %w[Job Internship].freeze
  validates :exp_type, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :country, presence: true
end
