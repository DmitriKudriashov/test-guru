# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[edit destroy show update]
  before_action :find_test, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  rescue_from ActiveRecord::RecordNotDestroyed, with: :rescue_with_question_not_destroyed
  rescue_from ActiveRecord::RecordNotSaved, with: :rescue_with_question_not_saved

  def index
    @questions = @test.questions # Question.all #
  end

  def new
    @question = @test.questions.new(question_params)
  end

  def edit; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    render inline: '<h3> Question: <%= @question.body %> was successfully destroyed.</h3>
     <p> <%= link_to "Back", questions_path %> </p>'
  end

  def show
    # render inline: '<h3> <%= @question.body %> </h3>'
  end

  private

  def rescue_with_question_not_found
    render plain: "The question: #{@question.id} ; #{@question.body} ; #{@question.test_id}not found!"
  end

  def rescue_with_question_not_destroyed
   render plain: "The question: #{@question.body} not deleted!!"
  end

  def rescue_with_question_not_saved
   render plain: "The question: #{@question.body} not saved!"
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
