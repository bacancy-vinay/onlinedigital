# frozen_string_literal: true

# Contact Model
class Contact < ApplicationRecord
  belongs_to :resume, optional: true
  belongs_to :business, optional: true
end
