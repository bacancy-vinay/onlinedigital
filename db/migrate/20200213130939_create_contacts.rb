class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :contact_no
      t.references :resume, foreign_key: true
      t.references :business, foreign_key: true
      t.timestamps
    end
  end
end
