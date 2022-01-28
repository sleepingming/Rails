require 'octokit'

class GistQuestionService
  ACCESS_TOKEN = Rails.application.credentials.github_access_token

  attr_reader :gist

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @gist = @client.create_gist(gist_params)
    gist(@gist)
  end

  private

  def gist(gist)
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
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
