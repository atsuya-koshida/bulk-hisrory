class Workout < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :quality
  belongs_to :training_menu
  has_many :workout_details, dependent: :destroy
  accepts_nested_attributes_for :workout_details, reject_if: :reject_both_blank, allow_destroy: true

  validates :date, presence: true
  validates :quality, presence: true
  validates :training_menu_id, presence: true
  validates :workout_details, presence: true

  def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:weight].blank? and attributes[:reps].blank?
      !attributes[:weight].blank? and attributes[:reps].blank?
    else
      attributes[:weight].blank? and attributes[:reps].blank?
    end
  end
end
