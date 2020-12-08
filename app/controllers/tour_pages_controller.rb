class TourPagesController < ApplicationController
  def home
    @tours = Tour.sort_place_name
                 .paginate(page: params[:page],
                           per_page: Settings.page.per_page)
  end
end
