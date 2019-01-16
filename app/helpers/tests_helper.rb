# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def list_of_users
    admin? ? [current_user] : User.all
  end
end
