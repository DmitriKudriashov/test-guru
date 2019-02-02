# frozen_string_literal: true

module TestPassagesHelper
  def result_status
    if @test_passage.test_passed?
      { value: 'ok',
      message: "Test #{@test_passage.correctly_percent} % ! Successfully Completed!",
      style: 'test-successfully' }
    else
      { value: 'bad',
      message: "Test Fail! Only #{@test_passage.correctly_percent} %! Try again!",
      style: 'test-failed' }
    end
  end

  def question_position
    " #{@test_passage.current_question_position} of #{@test_passage.total_questions}"
  end
end
