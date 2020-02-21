# frozen_string_literal: true

class Business < ApplicationRecord
  belongs_to :user
  has_many :addresses
  has_many :contacts
end
