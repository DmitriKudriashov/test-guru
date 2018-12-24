class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  # before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_question, on: %i[create update]

  SUCCESS_SCORE = 85

  def test_passed?
    correctly_percent >= SUCCESS_SCORE
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions = self.correct_questions.to_i + 1
    end
    self.current_question = next_question
    save!
  end

  def correctly_percent
    self.correct_questions.to_i * 100 / total_questions
  end

  def current_index_question
    test.questions.index(current_question) + 1
  end

  private

  def before_validation_set_question
    current_question.nil? && test.present? ? first_question : next_question
  end

  def first_question
    self.current_question = test.questions.first # if test.present?
  end

  def correct_answer?(answer_ids)
    # correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
    # correct_answers.ids.sort == answer_ids.map(&:idsto_i).sort
    correct_answer_count = correct_answers.count
    correct_answer_count == correct_answers.where(id: answer_ids).count &&
      correct_answer_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def total_questions
    test.questions.count.to_i
  end

end
