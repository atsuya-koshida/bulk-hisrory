class RemoveQualityFromWorkouts < ActiveRecord::Migration[5.2]
  def change
    remove_column :workouts, :quality, :integer
  end
end
