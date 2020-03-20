# frozen_string_literal: true

# Address model
class Address < ApplicationRecord
  belongs_to :resume, optional: true
  belongs_to :business, optional: true
  validates :address1, presence: true
  validates :address2, presence: true
  validates :country, presence: true
  validates :pincode, format: { with: /[0-9]{6}/, message: 'Enter digit only'}
end
