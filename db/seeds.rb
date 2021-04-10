require "open-uri"

User.destroy_all

def addUser(picture, name)
  user = User.create!(
    {email: "#{name}@email.com", first_name: name, last_name: "lee", password: "123456"}
  )

  user.avatar.attach(
    io: URI.open(picture), filename: "#{name}-pic.png"
  )
  return user
end

janeAvatar = "https://images.unsplash.com/photo-1531927557220-a9e23c1e4794?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1268&q=80"
jane = addUser(janeAvatar, "jane")

rossAvatar = "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
ross = addUser(rossAvatar, "ross")

rachelAvatar = "https://images.unsplash.com/photo-1498551172505-8ee7ad69f235?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzV8fHdvbWFufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
rachel = addUser(rachelAvatar, "rachel")

joeyAvatar = "https://images.unsplash.com/photo-1590086782957-93c06ef21604?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8bWFufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
joey = addUser(joeyAvatar, "joey")

monicaAvatar = "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8d29tYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
monica = addUser(monicaAvatar, "monica")

phoebeAvatar = "https://images.unsplash.com/photo-1482849297070-f4fae2173efe?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTA0fHxnaXJsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
phoebe = addUser(phoebeAvatar, "phoebe")

chandlerAvatar = "https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fG1hbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
chandler = addUser(chandlerAvatar, "chandler")

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

trip = Trip.create!(
  {
    destination: "Big Sur, California",
    description: "Ventana Big Sur. 48123 CA-1, Big Sur, CA 93920",
    start_date: "Sep 15, 2021",
    end_date: "Sep 23, 2021",
    meetup_time: "9:00",
    expected_end_time: "23:00",
    finished: false,
    user_id: jane.id
  }
)

Tripactivity6 = TripActivity.create({trip_id: trip.id, activity_id: Activity.first.id})

invitation6 = Invitation.create([
  {trip_id: trip.id, user_id: ross.id},
  {trip_id: trip.id, user_id: rachel.id}
])

trip = Trip.create!(
  {
    destination: "Starved Rock State Park",
    description: "2678 E 875th Rd, Oglesby, IL 61348",
    start_date: "May 10, 2021",
    end_date: "May 10, 2021",
    meetup_time: "8:00",
    expected_end_time: "12:00",
    finished: false,
    user_id: jane.id
  }
)

Tripactivity1 = TripActivity.create(
  {trip_id: trip.id, activity_id: Activity.first.id}
)

invitation1 = Invitation.create(
  {trip_id: trip.id, user_id: monica.id}
)

trip = Trip.create!(
  {
    destination: "Banff National Park",
    description: "224 Banff Ave, Banff, AB T1L 1B3",
    start_date: "Feb 10, 2021",
    end_date: "Feb 17, 2021",
    meetup_time: "10:00",
    expected_end_time: "19:00",
    finished: true,
    user_id: jane.id
  }
)

Tripactivity2 = TripActivity.create([
  {trip_id: trip.id, activity_id: Activity.first.id},
  {trip_id: trip.id, activity_id: Activity.second.id},
  {trip_id: trip.id, activity_id: Activity.fifth.id}
])

invitation2 = Invitation.create([
  {trip_id: trip.id, user_id: phoebe.id},
  {trip_id: trip.id, user_id: joey.id}
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
    user_id: jane.id
  }
)

Tripactivity3 = TripActivity.create([
  {trip_id: trip.id, activity_id: Activity.third.id},
  {trip_id: trip.id, activity_id: Activity.second.id}
])

invitation3 = Invitation.create([
  {trip_id: trip.id, user_id: chandler.id},
  {trip_id: trip.id, user_id: ross.id}
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
    user_id: jane.id
  }
)

Tripactivity4 = TripActivity.create([
  {trip_id: trip.id, activity_id: Activity.first.id},
  {trip_id: trip.id, activity_id: Activity.third.id},
  {trip_id: trip.id, activity_id: Activity.second.id}
])

invitation4 = Invitation.create([
  {trip_id: trip.id, user_id: chandler.id},
  {trip_id: trip.id, user_id: monica.id},
  {trip_id: trip.id, user_id: joey.id},
  {trip_id: trip.id, user_id: ross.id}
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
    user_id: jane.id
  }
)

Tripactivity5 = TripActivity.create([
  {trip_id: trip.id, activity_id: Activity.first.id},
  {trip_id: trip.id, activity_id: Activity.fourth.id}
])

invitation5 = Invitation.create([
  {trip_id: trip.id, user_id: joey.id},
  {trip_id: trip.id, user_id: ross.id}
])

puts "Done with trip and activity create!"
