# frozen_string_literal: true

module TestPassagesHelper
  def result_status
    @test_passage.test_passed? ? ok : bad
  end

  def ok
    { value: 'ok',
      message: "Test #{@test_passage.correctly_percent} % ! Successfully Completed!" }
  end

  def bad
    { value: 'bad',
      message: "Test Fail! Only #{@test_passage.correctly_percent} %! Try again!" }
  end

  def question_index
    " #{@test_passage.current_index_question} of #{@test_passage.total_questions}"
  end
end
