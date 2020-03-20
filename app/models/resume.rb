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

  scope :searching, lambda { |s|
                      Resume.joins(:user, :about, :fieldchoice)
                            .where('users.first_name LIKE ?
                              OR abouts.profile LIKE ?
                              OR fieldchoices.main_field LIKE ?
                              OR fieldchoices.sub_field LIKE ?
                              OR fieldchoices.exp_year LIKE ?',
                                   "%#{s}%", "%#{s}%",
                                   "%#{s}%", "%#{s}%", "%#{s}%")
                    }
end
