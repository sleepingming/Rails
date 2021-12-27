class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :test_passages, dependent: :destroy


  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true


  has_secure_password

  def passed_tests(level)
    Test
      .joins(:test_passages)
      .where(level: level, test_passages: { user: id })
  end
end
