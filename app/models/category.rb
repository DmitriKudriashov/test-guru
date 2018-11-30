class Category < ApplicationRecord
	has_many :tests, dependent: :destroy

  validates :title, presence: true
  # scope-метод по умолчанию для получения Категорий, отсортированных по названию в порядке возрастания
  default_scope { order(title: :asc) }
end
