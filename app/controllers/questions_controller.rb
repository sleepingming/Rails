class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body)
  end

  def show
  end

  def new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_questions_path(@test)
    else
      render plain: 'Вопрос не сохранён'
    end
  end

  def destroy
    @question.destroy
    render plain: 'Вопрос удалён'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
