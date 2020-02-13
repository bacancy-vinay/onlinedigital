class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :pincode
      t.references :business, foreign_key: true
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
