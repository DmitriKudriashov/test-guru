class AuthenticatedController < ApplicationController

  before_action :authenticate_user!
  before_action :goto_request_page

end
