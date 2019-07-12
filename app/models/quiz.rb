class Quiz < ApplicationRecord

  # attr_accessor :id, :title, :skill_type, :pass_score, :duration
  validates :title, :skill_type, :pass_score, :duration, presence: true
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true

end
