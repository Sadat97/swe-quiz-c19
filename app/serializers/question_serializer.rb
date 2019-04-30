# frozen_string_literal: true

# Question Serializer
class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question_title, :quiz_id, :choices

  def choices
    object.choices
  end
end
