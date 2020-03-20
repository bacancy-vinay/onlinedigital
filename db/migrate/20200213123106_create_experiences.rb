# frozen_string_literal: true

# Experience table
class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :exp_type
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.date :start_date
      t.date :end_date
      t.text :info
      t.references :resume, foreign_key: true
      t.timestamps
    end
  end
end
