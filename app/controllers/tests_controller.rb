# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[edit update show]
  after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  # def start # temporarily left
  #   @user.tests.push(@test)
  # end

  def new
     @test = Test.new
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def show
  end

  def create
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

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id )
  end

  # def log_execute_time  # temporarily left
  #   start = Time.now
  #   yield
  #   finish = Time.now - start
  #   logger.info("execution time: #{finish * 1000}ms")
  # end

  def rescue_with_test_not_found
    render plain: 'Test was not found!'
  end
end

