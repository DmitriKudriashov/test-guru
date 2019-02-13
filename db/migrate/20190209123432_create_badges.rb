class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.integer :level, default: 0
      t.string :rule, default: ''
      t.string :file_image, default: ''

      t.timestamps
    end
    add_index :badges, :name
    add_index :badges, :level
    add_index :badges, %i[name level], unique: true
  end
end
