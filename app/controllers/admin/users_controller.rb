class Admin::UsersController < AdminController
  before_action :get_user, only: [:update, :destroy, :be_user, :be_admin]

  def index
    @users = User.recent_users.paginate(page: params[:page],
                                        per_page: Settings.per_page.default)
  end

  def update
    if @user.banned!
      flash[:success] = t "user.banned.success"
    else
      flash[:danger] = t "user.banned.fail"
    end

    redirect_to admin_users_path
  end

  def be_user
    if @user.user!
      flash[:success] = t "user.be_user.success"
    else
      flash[:danger] = t "user.be_user.fail"
    end

    redirect_to admin_users_path
  end

  def be_admin
    if @user.admin!
      flash[:success] = t "user.be_admin.success"
    else
      flash[:danger] = t "user.be_admin.fail"
    end

    redirect_to admin_users_path
  end

  def destroy
    if @user.banned? && @user.destroy
      flash[:success] = t "user.deleted.success"
    else
      flash[:danger] = t "user.deleted.fail"
    end

    redirect_to admin_users_path
  end

  private

  def get_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = t "user.nil"

    redirect_to admin_users_path
  end
end
