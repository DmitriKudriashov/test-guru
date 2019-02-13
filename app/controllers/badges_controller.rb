class BadgesController < ApplicationController

  before_action :authenticate_user!

  def index
    @badges = Badge.all
  end

  def badges_users
    @badges = current_user.badges
  end
end
