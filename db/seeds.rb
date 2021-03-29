# This was created for testing
# Item.destroy_all
# Label.destroy_all
# User.destroy_all

# user = User.create!(email: 'a@a.com', password: '123456')
# label = Label.create!(name: 'boots', category: 'hiking')
# item = Item.new(name: 'boots')
# item.user = user
# item.label = label
# item.save!

# require 'csv'

# CSV.foreach('app/assets/csv/gosford_overnight_packing.csv') do |row|
#   label_name = row[1]
#   label_category = row[0]
#   puts "Adding one label from Fred's past trip..."
#   Label.create!(name: label_name, category: label_category)
#   puts "Added #{label_name}!"
# end

# Labels seed 2.0
labels = {
  "navigation" => ["map", "compass"], 
  "sun protection" => ["sunglasses", "sunscreen"],
  "insulation" => ["extra clothing"],
  "illumination" => ["headlamp/flashlight"],
  "medical supplies" => ["first-aid kit"],
  "fire" => ["waterproof matches/lighter/candle"],
  "repair kit and tools" => ["knife", "cordage", "duct tape"],
  "nutrition" => ["extra food"],
  "hydration" => ["extra water"],
  "emergency shelter" => ["tent/emergency blanket"]
}
puts "cleaning labels..."
Label.destroy_all

labels.each do |category|
  category.each do |label|
    puts "Adding #{label} of #{category} to labels"
    Label.create(category: category, name: label)
    puts "Done!"
  end
end

  # Add Activity and Recommended_label
activities = ['hiking', 'camping', 'hunting', 'fishing', 'canoeing', 'kayaking', 'rafting', 'sailing', 'motorboating', 'biking', 'rock climbing', 'horseback riding', 'skiing']

puts "cleaning activities..."
Activity.destroy_all

activities.each do |activity|
  puts "Adding the activity #{activity}"
  Activity.create!(name: activity)
  puts "Added #{activity}!"
end

all_labels = Label.all

puts "cleaning recommendations..."
RecommendedItemLabel.destroy_all

puts "Populating recommendations for hiking..."
all_labels.each do |label|
  Activity.first.recommended_item_labels << RecommendedItemLabel.create!(label: label, activity: Activity.first)
end
puts "Done!"

puts "Populating recommendations for camping..."
all_labels.each do |label|
  Activity.first.recommended_item_labels << RecommendedItemLabel.create!(label: label, activity: Activity.first)
end
puts "Done!"
