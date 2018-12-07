# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[edit destroy show update]
  before_action :find_test_of_question, only: %i[index create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render inline:
      '<h3> <%= @test.title %> </h3>
       <% @questions.each { |q| %>
       <p> <%= q.body %> </p>
       <% } %>'
  end

  def new; end

  def edit; end

  def create
    @question = @test.questions.create(question_params)
    render html: @question.inspect
  end

  def update; end

  def destroy
    @question.destroy
  end

  def show
    render inline: '<h3> <%= @question.body %> </h3>'
  end

  private

  def rescue_with_question_not_found
    render plain: 'The question not found!'
  end

  def find_test_of_question
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
