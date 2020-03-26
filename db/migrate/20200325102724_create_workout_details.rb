class CreateWorkoutDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_details do |t|
      t.float :weight, null: false
      t.integer :reps, null: false
      t.references :workout, null: false, foreign_key: true
      t.timestamps
    end
  end
end
