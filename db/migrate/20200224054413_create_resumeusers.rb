# frozen_string_literal: true

# Resume Users table
class CreateResumeusers < ActiveRecord::Migration[5.2]
  def change
    create_table :resumeusers do |t|
      t.string :prefix,            null: false,      default: ''
      t.string :first_name,        null: false,      default: ''
      t.string :last_name,         null: false,      default: ''
      t.string :email,             null: false,      default: ''
      t.string :website,           null: false,      default: ''
      t.string :linkedin,          null: false,      default: ''
      t.date   :birthdate,         null: false,      default: ''
      t.references :resume, foreign_key: true
      t.timestamps
    end
  end
end
