# frozen_string_literal: true

# Resume Users table
class CreateResumeusers < ActiveRecord::Migration[5.2]
  def change
    create_table :resumeusers do |t|
      t.string :prefix
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :mobile
      t.string :website
      t.string :linkedin
      t.date   :birthdate
      t.references :resume, foreign_key: true
      t.timestamps
    end
  end
end
