class TourPagesController < ApplicationController
  def home
    redirect_to admin_bookings_path if logged_in? && current_admin?

    @tours = Tour.sort_place_name
                 .paginate(page: params[:page],
                           per_page: Settings.per_page.default)
  end
end
