class User::UsersController < UserController
  before_action :get_user, only: :index

  def index; end

  private

  def get_user
    @user = current_user
    return if @user

    flash[:warning] = t "user.nil"
    redirect_to user_users_path
  end
end
