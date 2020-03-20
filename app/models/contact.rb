class Contact < ApplicationRecord
  belongs_to :business
  validates :contact_no, format: { with: /[0-9]{10}/, message: 'Enter 10 digit only'}
end
