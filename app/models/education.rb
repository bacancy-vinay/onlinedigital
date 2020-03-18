# frozen_string_literal: true

# Educaiton Model
class Education < ApplicationRecord
  belongs_to :resume
  STATUS = ['completed', 'Under-Graduate', 'Graduated', 'Matriculating',
            'Matriculated', 'Pursuing', 'Post graduated',
            'Not applicable'].freeze

  validates :name, presence: true
  validates :board, presence: true
  validates :graduation_status, presence: true
  validates :result, presence: true


end
