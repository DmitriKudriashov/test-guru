class TestsController < ApplicationController
  # /tests?level=2&lang=en
  # /tests?data%5Blevel%5D=2&data%5Blang%5D=en

  def index
    # render html: '<h1> All tests </h1>'.html_safe

    # render json: { tests: Test.all}

    # render inline: '<p> My favorite language is: <%= %[ybuR].reverse! %> </p>'

    # render file: 'public/about', layout: false

    # head 204
    # head :no_content

    # byebug

    # render inline: '<%= console %>'

    # logger.info(self.object_id)

    # respond_to do |format|
    #   format.html { render plain: 'ALL Tests'}
    #   format.json { render json: { tets: Test.all } }
    # end

    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")

  end

  def show
    # render plain: 'Show test'

    redirect_to root_path
    # redirect_to 'https://rubyonrails.org'
  end

  def new

  end

  def create

    test = Test.create(test_params)

    render plain: test.inspect

  end


  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

end

