# frozen_string_literal: true

# owner model
class Owner < ApplicationRecord
  belongs_to :business
end
