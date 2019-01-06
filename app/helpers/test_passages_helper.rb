module TestPassagesHelper

  def result_status
    @test_passage.test_passed? ? ok : bad
  end

  def ok
    ['ok', "Test #{@test_passage.correctly_percent} % ! Successfully Completed!"]
  end

  def bad
    ['bad', 'Test Fail! Try again!']
  end

  def question_index
    " #{@test_passage.current_index_question} of #{@test_passage.total_questions}"
  end
end
