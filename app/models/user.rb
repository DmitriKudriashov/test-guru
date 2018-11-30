class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :author_tests, class_name: 'Test'

  validates :email, presence: true, uniqueness: true, if: :email_valid?
  scope :listing, ->(level) { where(level: level) }

  # Создайте инстанс-метод в модели User, который принимает
  # в качестве аргумента значение уровня сложности и возвращает список всех Тестов,
  # которые проходит или когда-либо проходил Пользователь на этом уровне сложности
  def list_tests(level)
    tests.listing(level)
  end

  private

  def email_valid?
    email.match(/.+@.+\..+/i)
  end
end
