class GistsController < ApplicationController
  def create
    set_test_passage
    result = GistQuestionService.new(@test_passage.current_question).gist

    if result.success?
      flash[:notice] = t('gists.success_html', url: result.url)
      Gist.create!(gist_url: result.url, user_email: current_user.email, question: @test_passage.current_question)
    else
      flash[:alert] = t('gists.failure')
    end
    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
