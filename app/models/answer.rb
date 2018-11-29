class Answer < ApplicationRecord
	belongs_to :question

  # Наличие атрибута body
  validates :body, presence: true
  # У одного Вопроса может быть от 1-го до 4-х ответов.
  validate :validate_number_answers
  # для выбора правильных Ответов
  scope :corrected, -> { where(correct: true) }

  private

  def validate_number_answers
    errors.add(:question, 'Quantity answers must be between:(1..4)!') if question.answers.count > 4 || question.answers.count = 0
  end
end
