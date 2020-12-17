class TourPagesController < ApplicationController
  def home
    @tours = Tour.sort_place_name.includes(:tour_details)
                 .paginate(page: params[:page],
                           per_page: Settings.per_page.default)
  end
end
