class Admin::ToursController < AdminController
  before_action :get_tour, only: :show

  def index
    @tours = Tour.recent_tours.includes(tour_details: [:tour])
                 .paginate(page: params[:page],
                           per_page: Settings.per_page.default)
    @tour = Tour.new
  end

  def show
    # @tour_detail to create new tour_detail in modal of Tour page
    @tour_detail = TourDetail.new
  end

  private

  def get_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour

    flash[:warning] = t "tour.nil"

    redirect_to admin_tours_path
  end
end
