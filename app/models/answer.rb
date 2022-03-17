class Answer < ApplicationRecord

  belongs_to :question

  validate :validate_answers, on: :create
  validates :title, presence: true

  scope :correct, -> { where(correct: true) }

  def validate_answers
    if question.answers.count >= 4
      errors.add(:answer, "Количество ответов должно быть от 1 до 4")
    end
  end
end
