class Resume < ApplicationRecord
  belongs_to :user
  has_one :about
  has_many :skill
  has_many :educations
  has_many :experiences
  has_many :interest
  has_many :addresses
  has_one :fieldchoice

  PREFIX_LIST = ["Mr.", "Mrs", "Ms.", "Dr."]
end
