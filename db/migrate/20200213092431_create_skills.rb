# frozen_string_literal: true

# Skill table
class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :skill_list
      t.string :rating
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
