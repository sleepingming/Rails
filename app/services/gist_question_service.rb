require 'octokit'

class GistQuestionService
  ACCESS_TOKEN = Rails.application.credentials.github_access_token

  attr_reader :gist

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def gist
    @gist = @client.create_gist(gist_params)
    call(@gist)
  end

  private

  def call(gist)
    gist_params = GistStruct.new(gist.html_url)
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
