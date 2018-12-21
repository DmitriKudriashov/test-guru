# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category,  optional: true
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: :author_id, optional: true

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                    message: 'Title and level must be unique combination' }

  scope :easy, -> { where(level: 0..1) }
  scope :mid, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  validates :level, numericality: { only_integer: true, greater_than: 0 }

  default_scope { order(title: :desc) }
  scope :by_category,
    ->(title) { joins(:category).where(categories: { title: title }) }

  def self.list_by_category(title)
    by_category(title).pluck(:title)
  end
end
