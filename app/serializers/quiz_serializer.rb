class QuizSerializer
  include FastJsonapi::ObjectSerializer
  has_many :questions
end
