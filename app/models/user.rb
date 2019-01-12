# frozen_string_literal: true

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, uniqueness: true, presence: true, format: /.+@.+\..+/i

  has_secure_password

  scope :listing, ->(level) { where(level: level) }

  def list_tests(level)
    tests.listing(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
