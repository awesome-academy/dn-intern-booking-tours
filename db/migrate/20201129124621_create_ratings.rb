class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :tour_id
      t.integer :rate_number

      t.timestamps
    end
    add_index :ratings, :tour_id
    add_index :ratings, :user_id
    add_index :ratings, [:tour_id, :user_id],
                        unique: true
  end
end
