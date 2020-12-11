class SessionsController < ApplicationController
  before_action :fake_user, only: :new

  def new
    redirect_to root_path if logged_in?
  end

  def destroy
    log_out

    redirect_to root_path
  end

  private

  def fake_user
    session[:user_id] = User.second.id
  end
end
