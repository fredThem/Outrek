# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('app/assets/csv/gosford_overnight_packing.csv') do |row|
  label_name = row[1]
  label_category = row[0]
  puts "Adding one label from Fred's past trip..."
  Label.create!(name: label_name, category: label_category)
  puts "Added #{label_name}!"
end

  # Need to add Activity and Recommended_label
activities = ['hiking', 'camping', 'hunting', 'fishing', 'canoeing', 'kayaking', 'rafting', 'sailing', 'motorboating', 'biking', 'rock climbing', 'horseback riding', 'skiing']

activities.each do |activity|
  puts "Adding an activity..."
  Activity.create!(name: activity)
  puts "Added #{activity}!"
end

all_labels = Label.all

puts "Populating recommendation for hiking..."
all_labels.each do |label|
  Activity.first.recommended_item_labels << RecommendedItemLabel.create!(label: label, activity: Activity.first)
end
puts "Done!"