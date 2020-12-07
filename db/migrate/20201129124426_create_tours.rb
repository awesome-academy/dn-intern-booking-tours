class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :place
      t.float :rating_average
      t.string :title
      t.string :description
      t.integer :type_of_tour

      t.timestamps
    end
  end
end
