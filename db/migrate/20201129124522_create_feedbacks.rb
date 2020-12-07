class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :tour_id
      t.integer :user_id
      t.integer :parent_id
      t.string :content

      t.timestamps
    end
    add_index :feedbacks, :tour_id
    add_index :feedbacks, :user_id
    add_index :feedbacks, [:tour_id, :user_id],
                          unique: true
  end
end
