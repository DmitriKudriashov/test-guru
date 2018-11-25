class AddIndexToTestsUser < ActiveRecord::Migration[5.2]
  def change
    add_index :tests_users, [ :test_id, :user_id ], unique: true
  end
end
