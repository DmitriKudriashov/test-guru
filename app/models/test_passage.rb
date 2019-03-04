# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: [:create, :update]

  def time_to_left
    (self.test.timer - (Time.current - self.created_at).seconds ).to_i
  end

  def test_passed?
    correctly_percent >= 85
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions = self.correct_questions + 1
    end

    save!
  end

  def correctly_percent
    correct_questions.to_f * 100 / total_questions
  end

  def current_question_position
    test.questions.index(self.current_question) + 1
  end

  def total_questions
    test.questions.count
  end

  private

  def before_validation_set_question
    current_question.nil? && test.present? ? first_question : next_question
  end

  def first_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
