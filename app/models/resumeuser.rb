# frozen_string_literal: true

# Resumeuser model
class Resumeuser < ApplicationRecord
  belongs_to :resume, optional: true
  PREFIX_LIST = ['Mr.', 'Mrs', 'Ms.', 'Dr.'].freeze
end
