class Workout < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :quality
  belongs_to :training_menu
  has_many :workout_details, dependent: :destroy
  accepts_nested_attributes_for :workout_details, allow_destroy: true

  validates :date, presence: true
  validates :quality, presence: true
  validates :training_menu_id, presence: true
  validates :workout_details, presence: true
end
