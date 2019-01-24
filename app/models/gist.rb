class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user


  def create_gist_from_test_passage(question, url)
    current_user.gists.create(
      question: question,
      url: url
    )
  end

end
