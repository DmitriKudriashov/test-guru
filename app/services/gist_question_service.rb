class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def gist_create
    @client.create_gist(gist_params)
  rescue StandardError
    nil
  end

  private

  def gist_params
    {
      description: I18n.t('gist_description', title: @test.title),
      public: false,
      files: {
        "test-guru-question.txt": {
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

