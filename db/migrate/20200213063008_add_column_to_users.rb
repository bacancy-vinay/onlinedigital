# frozen_string_literal: true

# Add column to user table
class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name,   :string
    add_column :users, :last_name,    :string
    add_column :users, :mobile,       :integer
  end
end
