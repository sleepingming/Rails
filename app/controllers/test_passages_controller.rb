class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show;end

  def result;end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      @test_passage.update(success_passed?: true) if @test_passage.success?
      BadgeService.new(@test_passage).call
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
