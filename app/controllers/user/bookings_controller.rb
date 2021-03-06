class User::BookingsController < UserController
  def show
    @tour_detail = TourDetail.find_by id: params[:id]
    @booking = Booking.new
    return if @tour_detail

    flash[:danger] = t "tour.nil"
    redirect_to root_path
  end

  def create
    @booking = current_user.bookings.new booking_params
    if @booking.save
      flash[:success] = t "booking.success"
      redirect_to root_path
    else
      flash.now[:danger] = t "booking.fail"
      render :show
    end
  rescue StandardError
    flash[:danger] = t "booking.booked"
    redirect_to root_path
  end

  private

  def check_login
    return if logged_in?

    flash[:warning] = t "user.pls_login"
    redirect_to login_path
  end

  def booking_params
    params.require(:booking)
          .permit :tour_detail_id,
                  :number_of_bookers,
                  :current_price,
                  :contact_name,
                  :contact_number,
                  :status
  end
end
