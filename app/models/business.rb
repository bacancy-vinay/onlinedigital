# frozen_string_literal: true

# Business model
class Business < ApplicationRecord
  belongs_to :user
  has_many :owners, inverse_of: :business
  accepts_nested_attributes_for :owners, reject_if: :all_blank,
                                         allow_destroy: true
  has_many :addresses, inverse_of: :business
  accepts_nested_attributes_for :addresses, reject_if: :all_blank,
                                            allow_destroy: true
end
