class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  has_many :gists
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    if test_passage_time.nil?
      current_question.nil?
    else
      current_question.nil? || test_passage_time <= 0
    end
  end

  def test_passage_time
    if self.test.time.present?
      (self.created_at + self.test.time.to_i * 60) - Time.now
    end
  end

  def questions_in_test
    self.test.questions.count
  end

  def pass_percent
    correct_questions.to_f / questions_in_test.to_f * 100
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = next_question
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
end
