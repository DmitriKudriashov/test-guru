# frozen_string_literal: true

class Admin::AnswersController < Admin::BaseController

  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[show edit update destroy]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to admin_question_path(@answer.question), notice: 'Answer was successfully created.'
      # redirect_to @answer, notice: 'Answer was successfully created.' # OLD
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_path(@answer.question), notice: 'Answer was successfully updated.'
      # redirect_to @answer, notice: 'Answer was successfully updated.' # OLD
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question), notice: 'Answer was successfully destroyed.'
    # redirect_to @answer.question, notice: 'Answer was successfully destroyed.' # OLD
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
