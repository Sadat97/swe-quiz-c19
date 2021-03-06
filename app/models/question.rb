# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :quiz
  has_many :choices, dependent: :destroy

  validates :question_title, :quiz, presence: true
  validate :choices?, :only_one_correct?
  before_update :delete_old_choices
  accepts_nested_attributes_for :choices, allow_destroy: true

  private

  def delete_old_choices
    choices = []
    true
  end

  def only_one_correct?
    if choices.map(&:correct_choice).count(true) == 1
      true
    else
      errors.add(:choices, "#{question_title} has to have only 1 correct choice")
    end
  end

  def choices?
    choices.size >= 3 ? true : errors.add(:choices, "#{question_title} has less than 3 choices")
  end
end
