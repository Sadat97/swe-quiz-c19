class Quiz < ApplicationRecord

  validates :title, :skill_type, :pass_score, :duration , presence: true

end
