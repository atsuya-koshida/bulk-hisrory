class CreateTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :training_menus do |t|
      t.string :title,    null: false
      t.integer :part_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    add_index :training_menus, :title
  end
end
