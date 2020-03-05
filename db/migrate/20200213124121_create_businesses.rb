# frozen_string_literal: true

# Business table
class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.text   :info
      t.string :email
      t.string :website
      t.string :business_pan
      t.integer :mobile
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
