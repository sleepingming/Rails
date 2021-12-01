class Test < ApplicationRecord
  def self.tests_by(category)
    joins("JOIN categories ON categories.id = tests.category_id")
    .where(categories: { title: category })
    .order(id: :desc)
    .pluck(:title)
end
