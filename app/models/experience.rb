# frozen_string_literal: true

# Experience Model
class Experience < ApplicationRecord
  belongs_to :resume

  EXPTYPE = ['Internship','Job']
end
