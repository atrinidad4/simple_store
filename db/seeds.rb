require 'csv'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# clears the existing data
Product.destroy_all
Category.destroy_all

# parse CSV and seed data
csv_file = Rails.root.join('db', 'products.csv')
csv_data = CSV.read(csv_file, headers: true)

csv_data.each do |row|
  # creates or finds category
  category = Category.find_or_create_by(name: row['category'])

  # creates the product
  Product.create(
    title: row['title'],
    description: row['description'],
    price: row['price'],
    stock_quantity: row['stock_quantity'],
    category: category
  )
end

puts "Seeding complete!"