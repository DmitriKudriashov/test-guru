class AddAttributeCorrectToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :correct, :boolean
	change_column_default(:answers, :correct, false) 	
  end
end
