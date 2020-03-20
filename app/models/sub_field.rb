# frozen_string_literal: true

# Sub field model
class SubField < ApplicationRecord
  belongs_to :main_field 
end
