# frozen_string_literal: true

# Interest table
class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.string :interest_list
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
