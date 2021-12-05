class Answer < ApplicationRecord

  belongs_to :question

  validate :validate_answers, on: :create
  validates :answer, presence: true

  scope :correct, -> { where(correct: true) }

  def validate_answers
    if question.answer.count >= 4
      errors.add(:answer, "Количество ответов должно быть от 1 до 4")
  end
end
