# frozen_string_literal: true

# Users objective
class CreateAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :abouts do |t|
      t.string :profile
      t.text :info
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
