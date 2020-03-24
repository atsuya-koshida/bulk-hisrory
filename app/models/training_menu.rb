class TrainingMenu < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :part
  belongs_to :user
  has_many :workouts

  validates :title, presence: true
  validates :part_id, presence: true
  validates :user_id, presence: true
end
