require 'faker'
puts "Clear all flats..."

Flat.destroy_all
puts "Generate flats..."

4.times do
  Flat.create!(
    name: Faker::Mountain.range,
    address: "#{Faker::Address.street_address}, #{Faker::Address.postcode} #{Faker::Address.city}",
    description: Faker::Fantasy::Tolkien.poem,
    price_per_night: Faker::Number.decimal(l_digits: 2),
    number_of_guests: Faker::Number.digit
  )
end
