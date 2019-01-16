# frozen_string_literal: true

class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    # if @test_passage.empty_answer?(params[:answer_ids])            ### kds  ???
    #   return render :show, alert: "You did't select any answers."  ### kds  ???
    # end                                                            ### kds  ???

    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
