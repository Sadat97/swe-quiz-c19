# frozen_string_literal: true

class Choice < ApplicationRecord
  belongs_to :question, optional: false

  validates :title, :question, presence: true

end
