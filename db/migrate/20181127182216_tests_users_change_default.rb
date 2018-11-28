  class TestsUsersChangeDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests_users, :value, 0
    change_column_null :tests_users, :user_id, false
    change_column_null :tests_users, :test_id, false
  end
end
