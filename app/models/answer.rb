class Answer < ApplicationRecord
	belongs_to :question

  # Наличие атрибута body
  validates :body, presence: true
  # У одного Вопроса может быть от 1-го до 4-х ответов.
  validate :validate_number_answers , on: :create
  # для выбора правильных Ответов
  scope :corrected, -> { where(correct: true) }

  def validate_number_answers
    errors.add(:question, 'quantity answers must be between:(1..4)!') if question.answers.count > 4
  end

end
