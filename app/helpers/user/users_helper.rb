module User::UsersHelper
  def reject_accepted booking
    !booking.paid? && booking.pending?
  end
end
