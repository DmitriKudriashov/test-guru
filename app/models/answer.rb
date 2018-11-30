class Answer < ApplicationRecord
  MAX_ANSWERS_BY_QUESTION = 4.freez

	belongs_to :question

  # Наличие атрибута body
  validates :body, presence: true
  # У одного Вопроса может быть от 1-го до 4-х ответов.
  validate :validate_number_answers , on: :create
  # для выбора правильных Ответов
  scope :corrected, -> { where(correct: true) }

  private

  def validate_number_answers
    errors.add(:question, 'quantity answers must be between:(1..4)!') if question.answers.count >= MAX_ANSWERS_BY_QUESTION
  end

end
