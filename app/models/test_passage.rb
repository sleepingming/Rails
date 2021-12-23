class TestPassage < ApplicationRecord

  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def questions_in_test
    self.test.questions.count
  end

  def pass_percent
    correct_answers.count.to_f / questions_in_test.to_f * 100
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def success?
    pass_percent >= SUCCESS_PERCENT
  end

  private

  def before_validation_set_first_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
