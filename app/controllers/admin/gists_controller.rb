class Admin::GistsController < ApplicationController
  def index
    @gists = Gist.all
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
