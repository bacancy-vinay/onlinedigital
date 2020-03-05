# frozen_string_literal: true

# Skill model
class Skill < ApplicationRecord
  belongs_to :resume
  RATING_LEVEL = ['BEGINNER', 'BASIC','GOOD', 'VERY GOOD','MASTER']
end
