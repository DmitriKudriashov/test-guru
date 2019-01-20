# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def hello_user
    return unless current_user

    flash.now[:notice] = "Hello, #{ current_user.first_and_last_name}"
  end

end
