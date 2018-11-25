class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  # belongs_to :author, class_name: 'User', foreign_key: :author_id

  # Создайте метод класса в модели Test, который возвращает отсортированный
  # по убыванию массив названий всех Тестов у которых Категория называется
  # определённым образом (название категории передается в метод в качестве аргумента).
  def self.list_by_category(category_name)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: {title: category_name}).order(title: :DESC).pluck(:title)
  end
end
