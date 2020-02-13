class CreateAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :abouts do |t|
      t.string      :info,      null: false,        default: ""
      t.references  :resume,    foreign_key: true

      t.timestamps
    end
  end
end
