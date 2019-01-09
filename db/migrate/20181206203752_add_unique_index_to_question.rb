# frozen_string_literal: true

class AddUniqueIndexToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_index :questions, %i[body test_id], unique: true
  end
end
