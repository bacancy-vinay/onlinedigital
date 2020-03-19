# frozen_string_literal: true

# Resumeuser model
class Resumeuser < ApplicationRecord
  belongs_to :resume, optional: true
  PREFIX_LIST = ['Mr.', 'Mrs', 'Ms.', 'Dr.'].freeze
  validates :email, format: { with: /[^@]+@[^\.]+\..+/,
                              message: 'Enter valid email address' }
  validates :first_name, format: { with: /[a-zA-Z]/,
                                   message: 'Enter valid First Name' }
  validates :last_name, format: { with: /[a-zA-Z]/,
                                  message: 'Enter valid Last Name' }
  validates :mobile, presence: { message: 'Enter valid Mobile' },
                     numericality: true,
                     length: { minimum: 10, maximum: 15 }
end
