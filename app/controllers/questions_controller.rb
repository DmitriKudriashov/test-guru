# frozen_string_literal: true

class QuestionsController < AuthenticatedController

  before_action :find_question, only: %i[edit destroy show update]
  before_action :find_test, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def edit; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_path(@question.test), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      render inline: '<h4> Question: <%= @question.body %> was successfully destroyed.</h4>
        <p> <%= link_to "Back", test_path(@question.test) %> </p>'
    else
      render inline: '<h3>The Question: <%= @question.body %>. Not deleted ! </h3>
        <p> <%= link_to "Back", questions_path %> </p>'
    end
  end

  def show; end

  private

  def rescue_with_question_not_found
    render plain: 'The question not found!'
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
