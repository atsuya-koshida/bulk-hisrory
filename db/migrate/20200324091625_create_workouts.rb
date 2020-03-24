class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.datetime :date, null: false
      t.integer :quality, null: false
      t.text :description
      t.references :training_menu, null: false, foreign_key: true
      t.timestamps
    end
  end
end
