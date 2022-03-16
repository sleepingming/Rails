class Badge < ApplicationRecord
  enum rule: { first_try: 1, success_category: 2, success_by_level: 3 }

  has_and_belongs_to_many :users

  validates :title, :rule, :image_url, :parameter, presence: true
end
