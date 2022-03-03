class Test < ApplicationRecord
  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, ->(wanted_level) { where(level: wanted_level) }

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, presence: true, uniqueness: { scope: :level }
  def self.tests_by(category)
    joins(:category)
    .where(categories: { title: category })
    .order(title: :desc)
  end

  def self.tests_by_level(level)
    by_level(level)
  end
end
