# frozen_string_literal: true

class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end





  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.create_gist_on_github
    if service.error_message
      flash_message = { alert: t('.failure', error: service.message_to_flash ) }
    else
      current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
      flash_message = { notice: t('.success', url: result[:html_url]) }
    end

    redirect_to @test_passage, flash_message
  end

  def update
    if params[:answer_ids].nil?
       flash_message = { alert: 'You should make a choice answer!' }
       redirect_to @test_passage, flash_message
    else
      update!
    end
  end

  private

  def update!
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
      assign_badge
    else
      render :show
    end
  end

  def assign_badge
    if @test_passage.test_passed?
      @badges = BadgeGivings.new(@test_passage).get_badges
      if @badges.present?
        current_user.badges.push(@badges)
        flash[:notice] = 'You have been assigned a new bage !'
      end
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
