class User < ApplicationRecord
  def passed_tests(level)
    Test
    .joins("JOIN results ON tests.id = results.test_id")
    .where(level: level, results: { user_id: id })
end
