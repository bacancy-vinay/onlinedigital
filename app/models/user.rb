# frozen_string_literal: true

# User device model
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :resumes, dependent: :destroy
  has_many :businesses, dependent: :destroy

  validates :email, format: { with: /[^@]+@[^\.]+\..+/,
                              message: 'Enter valid email address' }
  validates :first_name, format: { with: /[a-zA-Z]/,
                                   message: 'Enter valid First Name' }
  validates :last_name, format: { with: /[a-zA-Z]/,
                                  message: 'Enter valid Last Name' }
  validates :password, length: { in: 6..20,
                                 message: 'Password length (between 6-20)' }
  validates :mobile, presence: { message: 'Enter valid Mobile' },
                     numericality: true,
                     length: { minimum: 10, maximum: 15 }
end
