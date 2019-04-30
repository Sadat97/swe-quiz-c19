class QuizSerializer < ActiveModel::Serializer
  attributes :title, :pass_score, :duration, :id, :skill_type, :questions

  def questions
    object.questions.map { |q| QuestionSerializer.new(q) }
  end
end
