# frozen_string_literal: true

class TestsController < AuthenticatedController

  before_action :find_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
    @test.author_id = current_user.id # только в этом варианте при открытии формы там в дроб боксе author появляется текущий юзер
    # @test = current_user.author_tests.new #!!! этот вариант дает ошибку! unknown attribute 'user_id' for Test.
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def show; end

  def create
    # @test = current_user.author_tests.new(test_params) # дает ошибку: unknown attribute 'user_id' for Test.
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found!'
  end
end
