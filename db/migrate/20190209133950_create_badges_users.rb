class CreateBadgesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :badges_users do |t|
      t.references :badge, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :badges_users, %i[badge_id user_id]
  end
end

