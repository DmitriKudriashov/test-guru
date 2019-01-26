class GistQuestionService

  attr_reader :client, :error_message # for byebug

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def create_gist_on_github
    client.create_gist(gist_params)
  rescue StandardError => e
    @error_message = e.message
  end

  def message_to_flash
    if error_message.index("401 - Bad credentials")
      "Error: ( Not access to Gist on GitHub ) "
    end
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

