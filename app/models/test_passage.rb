class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: :create

  def test_passed?
    correctly_percent
    @correctly_percent >= 85
  end

  def completed?
    self.current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions = self.correct_questions.to_i + 1
    end

    self.current_question = next_question
    save!
  end

  def correctly_percent
    @correctly_percent = self.correct_questions.to_f * 100 / total_questions
  end

  def current_index_question
    test.questions.index(self.current_question).to_i + 1
  end

  def total_questions
    test.questions.count.to_i
  end

  private

  def before_validation_set_question
    self.current_question.nil? && test.present? ? first_question : next_question
  end

  def first_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    self.current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', self.current_question.id).first
  end
end
