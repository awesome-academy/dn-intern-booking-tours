class Admin::TourDetailsController < AdminController
  before_action :get_tour_detail, only: [:destroy, :update]

  def create
    @tour_detail = TourDetail.new tour_detail_create_params
    if @tour_detail.save
      flash[:success] = t "tour.add.success"
    else
      flash[:danger] = t "tour.add.fail"
    end

    redirect_to admin_tour_detail_path(@tour_detail.tour_id)
  end

  def update
    if @tour_detail.update tour_detail_update_params
      flash[:success] = t "tour.update.success"
    else
      flash[:danger] = t "tour.update.fail"
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

  def get_tour_detail
    @tour_detail = TourDetail.find_by id: params[:id]
    return if @tour_detail

    flash[:warning] = t "tour.nil"

    redirect_to admin_tours_path
  end

  def tour_detail_create_params
    params.require(:tour_detail)
          .permit :tour_id, :start_date, :end_date, :price
  end

  def tour_detail_update_params
    params.require(:tour_detail).permit :price if @tour_detail.bookings.present?

    params.require(:tour_detail)
          .permit :start_date, :end_date, :price
  end
end
