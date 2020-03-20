# frozen_string_literal: true

# Business model
class Business < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :owners, inverse_of: :business, dependent: :destroy
  accepts_nested_attributes_for :owners, reject_if: :all_blank,
                                         allow_destroy: true
  has_many :addresses, inverse_of: :business, dependent: :destroy
  accepts_nested_attributes_for :addresses, reject_if: :all_blank,
                                            allow_destroy: true
  has_many :contacts, inverse_of: :business, dependent: :destroy
  accepts_nested_attributes_for :contacts, reject_if: :all_blank,
                                           allow_destroy: true
  validates :title, presence: true
  validates :address1, presence: true
  validates :address2, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :pincode, length: { in: 6..10,
                                message: 'Enter valid pincode must be digits' }
  validates :owner_name, presence: true
  validates :info, presence: true
  validates :email, format: { with: /[^@]+@[^\.]+\..+/,
                              message: 'Enter valid email address' }
  validates :contact_no, presence: { message: 'Enter valid Mobile' },
                         numericality: true,
                         length: { minimum: 10, maximum: 15 }
  validate :image_type
  def thumbnail(input)
    images[input].variant(resize: '300x300!').processed
  end

  scope :searching, lambda { |s|
    Business.where('businesses.title LIKE ?
            OR businesses.owner_name LIKE ?
            OR businesses.owner_post LIKE ?',
                 "%#{s}%", "%#{s}%",
                 "%#{s}%")
  }

  private

  def image_type
    errors.add(:images, 'are missing') if images.attached? == false

    images.each do |image|
      unless image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, 'need to be JPEG or PNG')
      end
    end
  end
end
