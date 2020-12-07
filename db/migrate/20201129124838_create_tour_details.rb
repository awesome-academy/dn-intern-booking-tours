class CreateTourDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_details do |t|
      t.integer :tour_id
      t.datetime :start_date
      t.datetime :end_date
      t.float :price

      t.timestamps
    end
  end
end
