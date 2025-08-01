# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the `bin/rails db:seed` command (or `rake db:seed` in older versions of Rails).
#
# To use this file:
# 1. Ensure you have a `Province` model (`app/models/province.rb`).
# 2. Copy the code below into `db/seeds.rb`.
# 3. Run `bin/rails db:seed` from your terminal.

# puts "Seeding provinces and territories..."

# Using BigDecimal is best practice for monetary values to avoid floating point precision issues.
# Rates are stored as decimals (e.g., 5% is 0.05).
# provinces_data = [
#   { name: 'Alberta', gst_rate: BigDecimal('0.05'), pst_rate: nil, hst_rate: nil },
#   { name: 'British Columbia', gst_rate: BigDecimal('0.05'), pst_rate: BigDecimal('0.07'), hst_rate: nil },
#   { name: 'Manitoba', gst_rate: BigDecimal('0.05'), pst_rate: BigDecimal('0.07'), hst_rate: nil },
#   { name: 'New Brunswick', gst_rate: nil, pst_rate: nil, hst_rate: BigDecimal('0.15') },
#   { name: 'Newfoundland and Labrador', gst_rate: nil, pst_rate: nil, hst_rate: BigDecimal('0.15') },
#   { name: 'Northwest Territories', gst_rate: BigDecimal('0.05'), pst_rate: nil, hst_rate: nil },
#   { name: 'Nova Scotia', gst_rate: nil, pst_rate: nil, hst_rate: BigDecimal('0.14') },
#   { name: 'Nunavut', gst_rate: BigDecimal('0.05'), pst_rate: nil, hst_rate: nil },
#   { name: 'Ontario', gst_rate: nil, pst_rate: nil, hst_rate: BigDecimal('0.13') },
#   { name: 'Prince Edward Island', gst_rate: nil, pst_rate: nil, hst_rate: BigDecimal('0.15') },
#   { name: 'Quebec', gst_rate: BigDecimal('0.05'), pst_rate: BigDecimal('0.09975'), hst_rate: nil },
#   { name: 'Saskatchewan', gst_rate: BigDecimal('0.05'), pst_rate: BigDecimal('0.06'), hst_rate: nil },
#   { name: 'Yukon', gst_rate: BigDecimal('0.05'), pst_rate: nil, hst_rate: nil }
# ]

# provinces_data.each do |province_attrs|
#   province = Province.find_or_initialize_by(name: province_attrs[:name])
#   province.update!(province_attrs)
#   puts "Seeded or updated #{province.name}"
# end

# puts "Province seeding complete. Found or created #{Province.count} provinces/territories."
# <------------------------------------------------------------------------------------------------------------------>
# Seed data for image categories.
# Run `bin/rails db:seed` to load this data.

puts "Seeding image categories... 🖼️"

# An array of category names to be created.
category_names = [
  'Abstract',
  'Business & Finance',
  'Cartoon',
  'Cityscape',
  'Food & Drink',
  'Greenery',
  'Landscape',
  'Minimalist',
  'Portrait',
  'Still Life',
  'Technology',
  'Vector',
  'Wildlife',
  '3D Render'
]

# Loop through the array and create each category if it doesn't exist.
category_names.each do |name|
  Category.find_or_create_by!(name: name)
end

puts "Image category seeding complete. Total categories: #{Category.count}"
# <------------------------------------------------------------------------------------------------------------------>
