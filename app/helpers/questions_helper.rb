# frozen_string_literal: true

module QuestionsHelper

  def question_header(question)
    title = question.test.title
    action = question.new_record? ? "Create New" : "Edit"
    content_tag('h3', "#{action} #{title} Question")
  end

end
