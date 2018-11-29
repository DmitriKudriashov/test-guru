class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  #  from screencast ------------------------------------------->>>>
  # default_scope { order(created_at: :desc) }
  # scope :easy, -> (level) { where(level: level).order(created_at: :desc).first }
  # scope :easy_ruby, -> { easy.where(title: 'Ruby') }
  #
  # def self.easy(level)
  #   where(level: level).first
  # end
  # ------------------------------------------------------------->>>>

  # Наличие атрибутов title
  # Может существовать только один Тест с данным названием и уровнем
  validates :title, presence: true,
    uniqueness: { scope: :level, message: 'Title and level must be unique combination' }

  # the level from: [:easy, :mid, :havy]
  scope :easy, -> { where(level: 0..1) } # простой (нулевой или первый уровень)
  scope :mid, -> { where(level: 2..4) }  # средний (со второго по четвёртый)
  scope :havy, -> { where(level: 5..Float::INFINITY) } # сложный (с пятого и выше)(бесконечность: Float::INFINITY )

  # Уровень Теста может быть только положительным целым числом
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  # для вывода списка title по-убыванию
  scope :select_category, ->(title) { joins(:category).where(categories: { title: title }) }
  scope :order_by_title_desc, -> { order(title: :desc) }


  # Создайте метод класса в модели Test, который возвращает отсортированный
  # по убыванию массив названий всех Тестов у которых Категория называется
  # определённым образом (название категории передается в метод в качестве аргумента).
  def self.list_by_category(title)
    select_category(title).order_by_title_desc.pluck(:title)
  end
end
