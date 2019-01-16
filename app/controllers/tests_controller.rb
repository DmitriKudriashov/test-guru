# frozen_string_literal: true

class TestsController < AuthenticatedController

  before_action :find_test, only: :start  # %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
   hello_user
   @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def hello_user
    if current_user  #&& current_user.sign_in_count == 1
      unless session[:display_welcome]
        flash.now[:notice] = "Hello, #{current_user.first_name} #{current_user.last_name}"
        session[:display_welcome] = true
      end
    end
  end

  def find_test ## kds ?? может в старт вставить это
    @test = Test.find(params[:id])
  end

end
