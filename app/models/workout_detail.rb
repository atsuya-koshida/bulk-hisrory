class WorkoutDetail < ApplicationRecord
  belongs_to :workout

  validates :weight, presence: true
  validates :reps, presence: true
end
