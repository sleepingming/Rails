module QuestionsHelper

  def question_header(test,question)
    if question.persisted?
      "Редактировать вопрос из теста #{test.title}"
    else
      "Создать вопрос для теста #{test.title}"
    end
  end
end
