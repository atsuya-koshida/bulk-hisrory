class AddQualityIdToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :quality_id, :integer
  end
end
