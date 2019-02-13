class DeleteLevelFromBadge < ActiveRecord::Migration[5.2]
  def change
    remove_column :badges, :level
    # remove_index :badges, name: "index_badges_on_level"
    # remove_index :badges, name: "index_badges_on_name_and_level"
    remove_index :badges, name: "index_badges_on_name"
    add_index :badges, :name, unique: true
    add_index :badges, :file_image, unique: true
    add_index :badges, :rule, unique: true

  end
end
