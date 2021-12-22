class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :test_passages, dependent: :destroy

  validates :email, :password, presence: true

  def passed_tests(level)
    Test
      .joins(:test_passages)
      .where(level: level, test_passages: { user: id })
  end
end
