# frozen_string_literal: true

# Business table
class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :title
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.integer :pincode
      t.string :owner_name
      t.string :owner_post
      t.text   :info
      t.string :email
      t.string :website
      t.string :facebook
      t.string :instagram
      t.string :business_pan
      t.integer :contact_no
      t.string :add_info_title
      t.string :add_info_info
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
