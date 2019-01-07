# frozen_string_literal: true

class Answer < ApplicationRecord
  MAX_COUNT = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_number_answers, on: :create
  scope :correct, -> { where(correct: true) }

  private

  def validate_number_answers
    errors.add(:question, 'quantity answers must be between:(0..4)!') if question.answers.count >= MAX_COUNT
  end
end
