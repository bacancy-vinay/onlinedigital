class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.string :first_name,        null: false,      default: ""
      t.string :last_name,         null: false,      default: ""
      t.string :email,             null: false,      default: ""
      t.string :website,           null: false,      default: ""
      t.string :linkedin,          null: false,      default: ""
      t.datetime :birthdate,       null: false,      default: ""
      t.references :user,          foreign_key: true
    end
  end
end
