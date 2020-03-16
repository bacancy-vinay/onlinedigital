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

  validate :image_type
  def thumbnail(input)
    images[input].variant(resize: '300x300!').processed
  end

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
