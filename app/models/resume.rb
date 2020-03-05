# frozen_string_literal: true

# Resume model
class Resume < ApplicationRecord
  belongs_to :user
  has_one :about, dependent: :destroy
  has_many :skill, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_one :fieldchoice, dependent: :destroy
  has_one :resumeuser, dependent: :destroy
end
