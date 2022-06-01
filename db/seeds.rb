require 'faker'

puts 'cleanup'
Restaurant.destroy_all

5.times do
  puts 'create Restaurant'
  name = Faker::Restaurant.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.phone_number
  category = %w[chinese italian japanese french belgian].sample
  puts "Name: #{name}"
  puts "Address: #{address}"
  puts "Phone Number: #{phone_number}"
  puts "Category: #{category}"
  new_restaurant = Restaurant.new(name: name, address: address, phone_number: phone_number, category: category)
  new_restaurant.save
end
