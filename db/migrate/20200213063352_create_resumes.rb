# frozen_string_literal: true

# Resume table
class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.references :user, foreign_key: true
    end
  end
end
