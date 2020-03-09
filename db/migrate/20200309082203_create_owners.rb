class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :owner_name
      t.string :owner_post
      t.belongs_to :business, foreign_key: true

      t.timestamps
    end
  end
end
