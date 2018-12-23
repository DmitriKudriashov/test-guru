# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages #, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true, uniqueness: true, if: :email_valid?
  scope :listing, ->(level) { where(level: level) }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def list_tests(level)
    tests.listing(level)
  end

  private

  def email_valid?
    email.match(/.+@.+\..+/i)
  end
end
