class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.boolean:edu_type
      t.string :name
      t.string :degree
      t.string :cource
      t.date   :pass_year
      t.string :city
      t.string :result
      t.string :state
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
