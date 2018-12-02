# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :author_tests, class_name: 'Test'

  validates :email, presence: true, uniqueness: true, if: :email_valid?
  scope :listing, ->(level) { where(level: level) }

  def list_tests(level)
    tests.listing(level)
  end

  private

  def email_valid?
    email.match(/.+@.+\..+/i)
  end
end
