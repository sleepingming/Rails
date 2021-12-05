class User < ApplicationRecord

  has_many: created_tests, class_name: "Test", foreign_key: 'author_id', dependent: :destroy
  has_many: tests, through: results, dependent: : destroy
  has_many: results, dependent: :destroy

  validates:email, :password, presence: true

  def passed_tests(level)
    Test
    .joins(:results)
    .where(level: level, results: { user: id })
end
