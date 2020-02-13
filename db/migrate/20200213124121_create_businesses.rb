class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :info
      t.string :email
      t.string :website
      t.string :business_pan
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
