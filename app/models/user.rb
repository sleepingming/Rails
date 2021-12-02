class User < ApplicationRecord

  has_many: created_tests, class_name: "Test", foreign_key: 'author_id', dependent: :destroy
  has_many: tests, through: tests_users, dependent: : destroy
  has_many: tests_users
  def passed_tests(level)
    Test
    .joins("JOIN results ON tests.id = results.test_id")
    .where(level: level, results: { user_id: id })
end
