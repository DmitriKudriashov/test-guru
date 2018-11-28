class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :author_tests, class_name: 'Test'

  # Создайте инстанс-метод в модели User, который принимает
  # в качестве аргумента значение уровня сложности и возвращает список всех Тестов,
  # которые проходит или когда-либо проходил Пользователь на этом уровне сложности
  def list_tests(level)
    tests.where(level: level)
  end
end
