# frozen_string_literal: true

class TestsController < AuthenticatedController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
   hello_user
   @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def hello_user
    return unless current_user

    unless session[:display_welcome]
      flash.now[:notice] = "Hello, #{current_user.first_name} #{current_user.last_name}"
      session[:display_welcome] = true
    end
  end

end
