FactoryBot.define do
  factory :workout_detail do
    weight { 50 }
    reps { 10 }
    workout
  end
end