FactoryBot.define do
  factory :workout do
    date { 2020-03-26 03:55:00 }
    description { 'testを書く' }
    quality_id { 1 }
    training_menu
  end
end