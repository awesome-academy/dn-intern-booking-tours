class EditBookingIndexUnique < ActiveRecord::Migration[6.0]
  def change
    remove_index :bookings, [:user_id, :tour_detail_id]
    add_index :bookings, [:user_id, :tour_detail_id]
  end
end
