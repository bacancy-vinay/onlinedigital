# frozen_string_literal: true

# Mainfield model
class MainField < ApplicationRecord
  has_many :sub_fields, dependent: :destroy
end
