# frozen_string_literal: true

# choose field area
class CreateFieldchoices < ActiveRecord::Migration[5.2]
  def change
    create_table :fieldchoices do |t|
      t.string :main_field
      t.string :sub_field
      t.string :exp_year
      t.string :exp_month
      t.references :resume, foreign_key: true
      t.timestamps
    end
  end
end
