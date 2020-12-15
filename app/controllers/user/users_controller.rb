class User::UsersController < UserController
  before_action :get_user, only: [:index, :update, :change_password]

  def index; end

  def update
    if @user.update user_params
      flash[:success] = t "user.update.info.success"
    else
      flash[:danger] = t "user.update.info.fail"
    end

    redirect_to user_users_path
  end

  def change_password
    if check_valid_password?
      flash[:danger] = t "user.update.password.wrong_cur_passwd"
    elsif update_password!
      flash[:success] = t "user.update.password.success"
    else
      flash[:danger] = t "user.update.password.fail"
    end

    redirect_to user_users_path
  end

  private

  def get_user
    @user = current_user
    return if @user

    flash[:warning] = t "user.nil"
    redirect_to user_users_path
  end

  def user_params
    params.require(:user)
          .permit :full_name,
                  :phone_number,
                  :birthday,
                  :gender,
                  :address
  end

  def check_valid_password?
    current_password = params[:user][:current_password]
    BCrypt::Password.create(current_password) != current_user.password_digest
  end

  def update_password!
    password_digest = BCrypt::Password.create(params[:user][:password_digest])
    @user.update_collumn(:password_digest, password_digest)
  end
end
