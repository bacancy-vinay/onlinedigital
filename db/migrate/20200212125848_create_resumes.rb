class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :website
      t.string :linkedin
      t.datetime :birthdate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
