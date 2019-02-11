class AuthenticatedController < ApplicationController

  before_action :authenticate_user!
  # before_action :redirect_to_admin # commented ,t.e link TestGuru no redirected to tests for Admin!

  def redirect_to_admin
    redirect_to admin_tests_path if current_user.is_a?(Admin)
  end
end
