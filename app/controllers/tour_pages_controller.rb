class TourPagesController < ApplicationController
  before_action :get_tours, only: [:home, :search_tours]

  def home; end

  def search_tours
    if params[:place].blank?
      flash[:warning] = t "search.not_exist"
      redirect_to root_path
    else
      @tours = @tours.search_tours params[:place]
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def get_tours
    @tours = Tour.sort_place_name.includes(:tour_details)
                 .paginate(page: params[:page],
                           per_page: Settings.per_page.default)
  end
end
