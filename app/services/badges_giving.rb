class BadgesGiving

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def assign_badges_to_user
    @badges = badges_to_user
    return if @badges.blank?

    @badges.each do |badge|
      @user.badges.push(badge.last)
    end
   end

  private

  def badges_to_user
    badges_all = Badge.all
    badges = {}
    badge_backend = badges_all.where(rule: 'all_backend').first
    badges[:backend] = badge_backend if badge_backend && check_backend

    badge_first_try = badges_all.where(rule: 'on_first_try').first
    badges[:first_try] = badge_first_try if badge_first_try && check_first_try

    badge_hard = badges_all.where(rule: 'all_for_hard')
    badges[:test_hard] = badge_hard.first if badge_hard && check_test_hard
    badges
  end


  def check_first_try
    TestPassage.where(["test_id = ? and user_id = ?", @test_passage.test_id , @test_passage.user_id ]).count() == 1
  end

  def check_backend
    #@test_passage.test.category.title == 'Backend'
    @test_passage.test.category.title.include?('Backend') # recomended: BubuntuClu 11/02/19 20:07
  end

  def check_test_hard
    Test.hard.where(id: @test_passage.test_id).count() > 0
  end



end
