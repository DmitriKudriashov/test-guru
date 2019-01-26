# frozen_string_literal: true

class TestsController < AuthenticatedController

  def index
   @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

end
