# frozen_string_literal: true

# sub_field tabel
class CreateSubFields < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_fields do |t|
      t.string :sub_field
      t.references :main_field, foreign_key: true
      t.timestamps
    end
  end
end
