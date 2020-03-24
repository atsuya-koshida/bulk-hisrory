class Workout < ApplicationRecord
  belongs_to :training_menu

  validates :date, presence: true
  validates :quality, presence: true
  validates :training_menu_id, presence: true
end
