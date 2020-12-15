class Admin::UsersController < AdminController
  def index
    @users = User.recent_users.paginate(page: params[:page],
                                        per_page: Settings.per_page
                                                          .manage_table)
  end
end
