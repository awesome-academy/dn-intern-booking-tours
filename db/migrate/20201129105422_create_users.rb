class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.datetime :birthday
      t.integer :gender
      t.string :address
      t.string :authentication_token
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
