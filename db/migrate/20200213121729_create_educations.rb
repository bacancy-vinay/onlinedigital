# frozen_string_literal: true

# Education table
class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :name
      t.string :board
      t.string :degree
      t.string :cource
      t.string :graduation_status
      t.date   :pass_year
      t.string :city
      t.string :state
      t.string :country
      t.string :result
      t.references :resume, foreign_key: true
      t.timestamps
    end
  end
end
