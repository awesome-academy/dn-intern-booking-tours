# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(full_name: "Pham Le Hoan",
             email: "pham.le.hoan@sun-asterisk.com",
             phone_number: "0775400703",
             birthday: "01-01-1998",
             gender: 1,
             address: "Da Nang",
             role: 1,
             password: "hoan@123",
             password_confirmation: "hoan@123")

20.times do |n|
  full_name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  phone_number = "0912345678"
  birthday = "01-01-1995"
  gender = rand(1)
  address = Faker::Address.city
  role = 0
  password = "password"
  User.create!(full_name: full_name,
               email: email,
               phone_number: phone_number,
               birthday: birthday,
               gender: gender,
               address: address,
               role: role,
               password: password,
               password_confirmation: password)
end

10.times do |n|
  place = Faker::Address.city
  description = "This is the tour to go to #{place}.
                 Hope you enjoy it"
  Tour.create!(place: place,
               title: "Travel to " + place,
               description: description,
               type_of_tour: 1)
end

tours = Tour.all
tours.each do |tour|
  2.times do |n|
    tour_id = tour.id
    start_date = Faker::Date.between(from: Date.today,
                                     to: "2020-12-17")
    end_date = "2020-12-17"
    price = 3000000.00
    TourDetail.create!(tour_id: tour_id,
                       start_date: start_date,
                       end_date: end_date,
                       price: price)
  end
end
