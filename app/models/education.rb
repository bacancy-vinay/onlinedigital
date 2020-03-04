# frozen_string_literal: true

# Educaiton Model
class Education < ApplicationRecord
  belongs_to :resume
  STATUS = ['completed', 'Under-Graduate', 'Graduated', 'Matriculating', 'Matriculated', 'Pursuing', 'Post graduated', 'Not applicable'].freeze
end
