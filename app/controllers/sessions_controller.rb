class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
  end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user&.authenticate params[:session][:password]
      log_in @user
      redirect_to root_path
    else
      flash.now[:danger] = t "account.invalid_user"
      render :new
    end
  end

  def destroy
    log_out

    redirect_to root_path
  end
end
