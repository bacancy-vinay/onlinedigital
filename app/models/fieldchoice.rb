# frozen_string_literal: true

# Fieldchoice model
class Fieldchoice < ApplicationRecord
  belongs_to :resume

  MAIN_FIELD = ['Accounting.', 'IT', 'CIVIL', 'AUTOMOBILE'].freeze
  SUB_FIELD = ['ROR DEVVELOPER', 'LARAVEL DEVELOPER', 'IOS DEVELOPER', 'ANDROID DEVELOPER'].freeze
end
