# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController

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
      redirect_to admin_question_path(@question), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      msg = "Question: #{@question.body} was successfully destroyed."
    else
      msg = "Question: #{@question.body}  Not deleted !"
    end
      redirect_to admin_test_path(@question.test), notice: msg
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
