class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  def show;end

  def new
    @answer = Answer.new
  end

  def edit;end

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to admin_answer_path(@answer)
    else
      render :new
    end
  end

  def update
    if answer.update(answer_params)
      redirect_to admin_answer_path(@answer)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question)
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end
end
