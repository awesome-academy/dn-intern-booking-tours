class Admin::BookingsController < AdminController
  before_action :get_booking, only: [:destroy, :update, :paid, :refund, :cancel]

  def index
    @bookings = Booking.recent_bookings
                       .paginate(page: params[:page],
                                 per_page: Settings.per_page.manage_booking)
  end

  def destroy
    if later_end_date? && !@booking.paid? && @booking.destroy
      flash[:success] = t "booking.delete.success"
    else
      flash[:danger] = t "booking.delete.fail"
    end
    redirect_to admin_bookings_path
  end

  def paid
    if !later_end_date? && @booking.paid!
      update
      flash[:success] = t "booking.pay.success"
    else
      flash[:danger] = t "booking.pay.fail"
    end
  end

  def refund
    if !later_end_date? && @booking.refunded!
      cancel
      flash[:success] = t "booking.pay.success"
    else
      flash[:danger] = t "booking.pay.fail"
    end
  end

  def update
    if !later_end_date? && @booking.booked!
      flash[:success] = t "booking.update.success"
    else
      flash[:danger] = t "booking.update.fail"
    end
    redirect_to admin_bookings_path
  end

  def cancel
    if !@booking.paid? && !later_start_date? && @booking.canceled!
      flash[:success] = t "booking.canceling.success"
    else
      flash[:danger] = t "booking.canceling.fail"
    end
    redirect_to admin_bookings_path
  end

  private

  def get_booking
    @booking = Booking.find_by id: params[:id]
    return if @booking

    flash[:warning] = t "booking.nil"
    redirect_to admin_bookings_path
  end

  def later_start_date?
    Time.zone.today > @booking.tour_detail.start_date
  end

  def later_end_date?
    Time.zone.today > @booking.tour_detail.end_date
  end
end
