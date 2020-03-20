# frozen_string_literal: true

# main_field table
class CreateMainFields < ActiveRecord::Migration[5.2]
  def change
    create_table :main_fields do |t|
      t.string :main_field
      t.timestamps
    end
  end
end
