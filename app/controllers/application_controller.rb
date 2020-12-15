class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale, :check_banned

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def check_login
    return if logged_in?

    flash[:warning] = t "user.pls_login"
    redirect_to login_path
  end

  def check_admin
    return if current_admin?

    flash[:danger] = t "user.not_admin"
    redirect_to root_path
  end

  def check_banned
    return unless current_banned?

    log_out
    flash[:danger] = t "user.banned.success"
    redirect_to root_path
  end
end
