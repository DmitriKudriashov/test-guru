class Badge < ApplicationRecord

  RULES = { all_backend: 'Successful passing of all tests from the category Backend',
            on_first_try: 'Successful passing of the test at the first attempt',
            all_for_hard: 'Successful passing of all level tests hard'}.freeze

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users
end
