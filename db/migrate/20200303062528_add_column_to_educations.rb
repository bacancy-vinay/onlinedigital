# frozen_string_literal: true

# Add column to educations
class AddColumnToEducations < ActiveRecord::Migration[5.2]
  def change
    add_column :educations, :country, :string, default: ''
    add_column :educations, :board, :string, default: ''
    add_column :educations, :graduation_status, :string, default: ''
  end
end
