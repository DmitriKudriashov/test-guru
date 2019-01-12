class SessionsController < ApplicationController

  before_action :find_user, on: :create # %i[create update] # kds

  def new; end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to session[:request_page].to_s
      # redirect_to cookies[:path] || root_path
    else
      flash.now[:alert] = 'Are you Guru? Check your Email and Password!'
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    @user = nil
    # flash[:notice] = "You have successfully logged out."
    # redirect_to login_path, notice: 'Logout!'
    redirect_to login_path, notice: 'Logout!'
  end

  private

  def find_user
    @user = User.find_by(email: params[:email])
  end
end
