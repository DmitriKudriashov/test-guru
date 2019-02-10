class Badge < ApplicationRecord

  RULES = { all_backend: 'Successful passing of all tests from the category Backend',
            on_first_try: 'Successful passing of the test at the first attempt',
            all_for_hard: 'Successful passing of all level tests hard'}.freeze
            # 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard

  has_many :badges_users
  has_many :users, through: :badges_users
end
