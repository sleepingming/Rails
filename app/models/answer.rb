class Answer < ApplicationRecord
  scope :correct, -> { where(correct: true) }

  belongs_to :question

  validate :validate_answers
  validates :answer, presence: true

  def validate_answers
    if question.answer.count > 4
      errors.add(:answer, "Количество ответов должно быть от 1 до 4")
  end
end
