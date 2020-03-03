# frozen_string_literal: true

# Address table
class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :country
      t.string :state
      t.string :city
      t.integer :pincode
      t.references :business, foreign_key: true
      t.references :resume, foreign_key: true
      t.timestamps
    end
  end
end
