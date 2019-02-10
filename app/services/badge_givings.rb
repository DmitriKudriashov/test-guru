class BadgeGivings

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def get_badges
    badges = []
    Badge.all.each do |badge|
      # if .... any conditions..of  user tests passage
       badges.push(badge)
      # end
    end
    badges
  end
end
