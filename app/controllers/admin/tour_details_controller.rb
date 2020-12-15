class Admin::TourDetailsController < AdminController
  before_action :get_tour_detail, only: :destroy
  before_action :get_tour, only: :create

  def create
    @tour_detail = @tour.tour_details.new tour_detail_create_params
    if @tour_detail.save
      flash[:success] = t "tour.add.success"
    else
      flash[:danger] = t "tour.add.fail"
    end

    redirect_to admin_tour_path(@tour_detail.tour_id)
  end

  def destroy
    if @tour_detail.bookings.blank? && @tour_detail.destroy
      flash[:success] = t "tour.delete.success"
    else
      flash[:danger] = t "tour.delete.fail"
    end

    redirect_to admin_tour_path(@tour_detail.tour.id)
  end

  private

  def get_tour
    @tour = Tour.find_by id: params[:tour_id]
    return if @tour

    flash[:warning] = t "tour.nil"

    redirect_to admin_tours_path
  end

  def get_tour_detail
    @tour_detail = TourDetail.find_by id: params[:id]
    return if @tour_detail

    flash[:warning] = t "tour.nil"

    redirect_to admin_tours_path
  end

  def tour_detail_create_params
    params.require(:tour_detail)
          .permit :start_date, :end_date, :price
  end
end
