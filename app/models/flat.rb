class Flat < ApplicationRecord
  validates :name, :address, :price_per_night, presence: true
  validates :number_of_guests, numericality: {only_integer: true}
end
