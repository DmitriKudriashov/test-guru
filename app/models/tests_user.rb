# frozen_string_literal: true

class TestsUser < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
