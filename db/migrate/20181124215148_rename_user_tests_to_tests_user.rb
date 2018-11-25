class RenameUserTestsToTestsUser < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_tests, :tests_users
  end
end
