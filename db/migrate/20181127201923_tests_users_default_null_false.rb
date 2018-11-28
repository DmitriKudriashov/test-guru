class TestsUsersDefaultNullFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tests_users, :test_id, false
    change_column_null :tests_users, :user_id, false
  end
end
