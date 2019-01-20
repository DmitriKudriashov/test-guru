# frozen_string_literal: true

class TestsController < AuthenticatedController

#  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
   @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
end
