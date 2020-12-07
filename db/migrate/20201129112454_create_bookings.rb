class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :tour_detail_id
      t.integer :number_of_bookers
      t.float :current_price
      t.string :contact_name
      t.string :contact_number
      t.integer :payment_status
      t.integer :status

      t.timestamps
    end
    add_index :bookings, :user_id
    add_index :bookings, :tour_detail_id
    add_index :bookings, [:user_id, :tour_detail_id],
                         unique: true
  end
end
