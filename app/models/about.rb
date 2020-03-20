# frozen_string_literal: true

# About (Users objective)
class About < ApplicationRecord
  belongs_to :resume
  validates :profile, presence: true
  validates :info, presence: true
end
