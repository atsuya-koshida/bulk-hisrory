class Workout < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :quality
  belongs_to :training_menu
  accepts_nested_attributes_for :worout_detail, allow_destroy: true

  validates :date, presence: true
  validates :quality, presence: true
  validates :training_menu_id, presence: true
end
