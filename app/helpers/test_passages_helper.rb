module TestPassagesHelper

  def message_of_correctly_answered(test_passage)
    if test_passage.test_passed?
      status = 'success'
      message = 'Congratulation! Test successfully completed!'
    else
      status = 'fail'
      message = 'Fail! Try again! Please!'
    end

    bodies_text = [div_percentage_helper(test_passage.correctly_percent, status),
                   content_tag(:p, message)]

    bodies_text.join.html_safe
  end

  def div_percentage_helper(number, status)
    content_tag(:div, class: "percentage #{status}") do
      number_to_percentage(number, precision: 0)
    end
  end

  def header_current_question(test_passage)
    content_tag(:p) do
      "Current Question: #{test_passage.current_index_question} / #{test_passage.total_questions}"
    end
  end

end
