# frozen_string_literal: true

class SetUserEmailDefaultFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :email, false
    add_index :users, :email, unique: true
  end
end
