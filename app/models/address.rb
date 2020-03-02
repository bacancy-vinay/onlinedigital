# frozen_string_literal: true

# Address model
class Address < ApplicationRecord
  belongs_to :resume, optional: true
  belongs_to :business, optional: true
end
