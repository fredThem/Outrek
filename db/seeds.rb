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

# Past trips seed 1.0
User.destroy_all
user = User.create!([
  {email: "a@a.com", first_name: "Jane", last_name: "Lee", password: "123456"},
  {email: "ross@a.com", first_name: "Ross", last_name: "Geller", password: "123456"},
  {email: "rachel@a.com", first_name: "Rachel", last_name: "Green", password: "123456"},
  {email: "joey@a.com", first_name: "Joey", last_name: "Tribbiani", password: "123456"},
  {email: "monica@a.com", first_name: "Monica", last_name: "Geller", password: "123456"},
  {email: "phoebe@a.com", first_name: "Phoebe", last_name: "Buffay", password: "123456"}
])

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

labels.keys.each do |category|
  labels[category].each do |name|
    puts "Adding label '#{name}' of category '#{category}' to labels"
    Label.create(category: category, name: name)
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

# Upcoming Trip 1
trip = Trip.create!(
  {
    destination: "Big Sur, California",
    description: "Ventana Big Sur. 48123 CA-1, Big Sur, CA 93920",
    start_date: "Sep 15, 2021",
    end_date: "Sep 23, 2021",
    meetup_time: "9:00",
    expected_end_time: "23:00",
    finished: false,
    user_id: user.first.id
  }
)

checklist = Checklist.create!(trip_id: trip.id)

relevant_labels = []
Activity.first.recommended_item_labels.each do |rec|
  unless relevant_labels.include? rec.label
    relevant_labels << rec.label
    ChecklistItem.create(label: rec.label, checked: false, checklist: checklist)
  end
end

Tripactivity6 = TripActivity.create({trip_id: trip.id, activity_id: Activity.first.id})

invitation6 = Invitation.create([
  {trip_id: trip.id, user_id: user.second.id},
  {trip_id: trip.id, user_id: user.third.id}
])

# Upcoming Trip 2
trip = Trip.create!(
  {
    destination: "Starved Rock State Park",
    description: "2678 E 875th Rd, Oglesby, IL 61348",
    start_date: "May 10, 2021",
    end_date: "May 10, 2021",
    meetup_time: "8:00",
    expected_end_time: "12:00",
    finished: false,
    user_id: user.first.id
  }
)

checklist = Checklist.create!(trip_id: trip.id)

relevant_labels = []
Activity.first.recommended_item_labels.each do |rec|
  unless relevant_labels.include? rec.label
    relevant_labels << rec.label
    ChecklistItem.create(label: rec.label, checked: false, checklist: checklist)
  end
end

Tripactivity1 = TripActivity.create(
  {trip_id: trip.id, activity_id: Activity.first.id}
)

invitation1 = Invitation.create(
  {trip_id: trip.id, user_id: user.second.id}
)

# Past Trip
trip = Trip.create!(
  {
    destination: "Banff National Park",
    description: "224 Banff Ave, Banff, AB T1L 1B3",
    start_date: "Feb 10, 2021",
    end_date: "Feb 17, 2021",
    meetup_time: "10:00",
    expected_end_time: "19:00",
    finished: true,
    user_id: user.first.id
  }
)

checklist = Checklist.create!(trip_id: trip.id)

relevant_labels = []
Activity.first.recommended_item_labels.each do |rec|
  unless relevant_labels.include? rec.label
    relevant_labels << rec.label
    ChecklistItem.create(label: rec.label, checked: false, checklist: checklist)
  end
end

Tripactivity2 = TripActivity.create([
  {trip_id: trip.id, activity_id: Activity.first.id},
  {trip_id: trip.id, activity_id: Activity.second.id},
  {trip_id: trip.id, activity_id: Activity.fifth.id}
])

invitation2 = Invitation.create([
  {trip_id: trip.id, user_id: user.second.id},
  {trip_id: trip.id, user_id: user.third.id}
])

trip = Trip.create!(
  {
    destination: "Mont Gosford via Frontier Trail SF6",
    description: "901 Rant Tout-de-Joie, Woburn, QC G0Y 1R0",
    start_date: "Apr 24, 2020",
    end_date: "Apr 29, 2020",
    meetup_time: "8:00",
    expected_end_time: "15:00",
    finished: true,
    user_id: user.first.id
  }
)

checklist = Checklist.create!(trip_id: trip.id)

relevant_labels = []
Activity.first.recommended_item_labels.each do |rec|
  unless relevant_labels.include? rec.label
    relevant_labels << rec.label
    ChecklistItem.create(label: rec.label, checked: false, checklist: checklist)
  end
end

Tripactivity3 = TripActivity.create([
  {trip_id: trip.id, activity_id: Activity.third.id},
  {trip_id: trip.id, activity_id: Activity.second.id}
])

invitation3 = Invitation.create([
  {trip_id: trip.id, user_id: user.fourth.id},
  {trip_id: trip.id, user_id: user.fifth.id}
])

trip = Trip.create!(
  {
    destination: "Grand Canyon National Park",
    description: "Grand Canyon, AZ 86023",
    start_date: "Sep 13, 2020",
    end_date: "Sep 20, 2020",
    meetup_time: "7:00",
    expected_end_time: "19:00",
    finished: true,
    user_id: user.first.id
  }
)

checklist = Checklist.create!(trip_id: trip.id)

relevant_labels = []
Activity.first.recommended_item_labels.each do |rec|
  unless relevant_labels.include? rec.label
    relevant_labels << rec.label
    ChecklistItem.create(label: rec.label, checked: false, checklist: checklist)
  end
end

Tripactivity4 = TripActivity.create([
  {trip_id: trip.id, activity_id: Activity.first.id},
  {trip_id: trip.id, activity_id: Activity.third.id},
  {trip_id: trip.id, activity_id: Activity.second.id}
])

invitation4 = Invitation.create([
  {trip_id: trip.id, user_id: user.second.id},
  {trip_id: trip.id, user_id: user.third.id},
  {trip_id: trip.id, user_id: user.fourth.id},
  {trip_id: trip.id, user_id: user.fifth.id}
])

trip = Trip.create!(
  {
    destination: "Yellowstone Park",
    description: "2 Officers Row, Yellowstone National Park, WY 82190",
    start_date: "May 5, 2019",
    end_date: "May 10, 2019",
    meetup_time: "7:30",
    expected_end_time: "20:00",
    finished: true,
    user_id: user.first.id
  }
)

checklist = Checklist.create!(trip_id: trip.id)

relevant_labels = []
Activity.first.recommended_item_labels.each do |rec|
  unless relevant_labels.include? rec.label
    relevant_labels << rec.label
    ChecklistItem.create(label: rec.label, checked: false, checklist: checklist)
  end
end

TripActivity.create(trip: trip, activity: Activity.first)

invitation5 = Invitation.create([
  {trip_id: trip.id, user_id: user.fourth.id},
  {trip_id: trip.id, user_id: user.fifth.id}
])

puts "Done with trip and activity create!"
