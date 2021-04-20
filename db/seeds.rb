require "open-uri"

User.destroy_all

# TODO implement UI-face (https://uifaces.co/api-key)

def addUser(picture, first_name, last_name)
  user = User.create!(
    {email: "#{first_name}@email.com", first_name: first_name, last_name: last_name, password: "123456"}
  )

  user.avatar.attach(
    io: URI.open(picture), filename: "#{first_name}-pic.png"
  )
  return user
end

firstAvatar = "https://avatars.githubusercontent.com/u/71362526?v=4"
first = addUser(firstAvatar, "jane", "lee")

rossAvatar = "https://randomuser.me/api/portraits/men/91.jpg"
ross = addUser(rossAvatar, "ross", "meyers")

rachelAvatar = "https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29tYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
rachel = addUser(rachelAvatar, "rachel", "colbert")

joeyAvatar = "https://images.unsplash.com/photo-1590086782957-93c06ef21604?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8bWFufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
joey = addUser(joeyAvatar, "joey", "anderson")

monicaAvatar = "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8d29tYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
monica = addUser(monicaAvatar, "monica", "martinez")

phoebeAvatar = "https://images.unsplash.com/photo-1482849297070-f4fae2173efe?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTA0fHxnaXJsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
phoebe = addUser(phoebeAvatar, "phoebe", "lee")

chandlerAvatar = "https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fG1hbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
chandler = addUser(chandlerAvatar, "chandler", "nguyen")

aAvatar = "https:\/\/images.pexels.com\/photos\/415829\/pexels-photo-415829.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb"
a = addUser(aAvatar, "sasha", "ho")

bAvatar = "https:\/\/images.generated.photos\/aNQYYS0hAZyxZ0qlqKbI-bERqUBV36z8xUK5jacrLEs\/rs:fit:512:512\/Z3M6Ly9nZW5lcmF0\/ZWQtcGhvdG9zLzA5\/OTk4ODIuanBn.jpg"
b = addUser(bAvatar, "giselle", "franks")

cAvatar = "https:\/\/images.generated.photos\/z_w45-PQ28jY08f8O4BMykbnCVpwXsaoDvzoBgPYCg0\/rs:fit:512:512\/Z3M6Ly9nZW5lcmF0\/ZWQtcGhvdG9zL3Yy\/XzA4MzYxMDIuanBn.jpg"
c = addUser(cAvatar, "kent", "sosa")

dAvatar = "https:\/\/uifaces.co\/our-content\/donated\/xB857nIu.jpg"
d = addUser(dAvatar, "cooper", "gogari")

eAvatar = "https:\/\/uifaces.co\/our-content\/donated\/xB857nIu.jpg"
e = addUser(eAvatar, "jenil", "gogari")

fAvatar = "https:\/\/images.unsplash.com\/photo-1548537412-08ab4040f199?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
f = addUser(fAvatar, "Amiya", "Potts")

gAvatar = "https:\/\/images.generated.photos\/0PjDpiMOeF-HXb2lvBkGiApuNNESjm1YlhAMlJVT6PQ\/rs:fit:512:512\/Z3M6Ly9nZW5lcmF0\/ZWQtcGhvdG9zL3Yy\/XzA4MTg2OTYuanBn.jpg"
g = addUser(gAvatar, "Adolfo", "Hess")

hAvatar = "https:\/\/uifaces.co\/our-content\/donated\/0VZ0boL5.png"
h = addUser(hAvatar, "Alex", "Diwa")

iAvatar = "https:\/\/uifaces.co\/our-content\/donated\/Zh_4oc5l.jpg"
i = addUser(iAvatar, "Mary", "Martin")

jAvatar = "https://randomuser.me/api/portraits/men/32.jpg"
j = addUser(jAvatar, "leo", "McIver")

kAvatar = "https://randomuser.me/api/portraits/men/46.jpg"
k = addUser(kAvatar, "Konsta", "Vargas")

lAvatar = "https://uifaces.co/our-content/donated/gPZwCbdS.jpg"
l = addUser(lAvatar, "Veeti", "Wu")

mAvatar = "https://randomuser.me/api/portraits/men/86.jpg"
m = addUser(mAvatar, "Eduard", "Santos")

nAvatar = "https://uifaces.co/our-content/donated/rSuiu_Hr.jpg"
n = addUser(nAvatar, "Andrew", "Kumar")

oAvatar = "https://randomuser.me/api/portraits/men/36.jpg"
o = addUser(oAvatar, "Malan", "Reese")

pAvatar = "https://uifaces.co/our-content/donated/KtCFjlD4.jpg"
p = addUser(pAvatar, "Ferdinand", "Badour")

qAvatar = "https://randomuser.me/api/portraits/women/44.jpg"
q = addUser(qAvatar, "June", "Basha")

rAvatar = "https://images.unsplash.com/photo-1493666438817-866a91353ca9?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b616b2c5b373a80ffc9636ba24f7a4a9"
r = addUser(rAvatar, "Elliana", "Aman")

sAvatar = "https://randomuser.me/api/portraits/women/63.jpg"
s = addUser(sAvatar, "Britney", "Antonopoulos")

tAvatar = "https://randomuser.me/api/portraits/women/47.jpg"
t = addUser(tAvatar, "Leah", "Floros")

uAvatar = "https://randomuser.me/api/portraits/women/65.jpg"
u = addUser(uAvatar, "Laura", "Malik")

vAvatar = "https://randomuser.me/api/portraits/women/27.jpg"
v = addUser(vAvatar, "Kamel", "Laska")

wAvatar = "https://uifaces.co/our-content/donated/DR-4XH3z.jpeg"
w = addUser(wAvatar, "Rayan", "Furutani")

xAvatar = "https://images.generated.photos/ww2SDXw8K6Q4IJIMVN1KN-70YbJmtFi-jrg7pGo7jE0/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/ODEwNDguanBn.jpg"
x = addUser(xAvatar, "Suki", "Hashimoto")

yAvatar = "https://randomuser.me/api/portraits/women/16.jpg"
y = addUser(yAvatar, "Alison", "Konishi")

zAvatar = "https://i.imgur.com/CdD60W6.jpg"
z = addUser(zAvatar, "Marcia", "Ito")


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
  "shelter" => ["tent", "emergency blanket"]
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

puts "Populating essential recommendations for all activities"
all_labels.each do |label|
  Activity.all.each do |activity|
    activity.recommended_item_labels << RecommendedItemLabel.create!(label: label, activity: activity)
  end
end
puts "Done!"

#add more recommendations for individual activity
extra_labels = {
  "clothing" => ["base-layer", "mid-layer", "rain wear"],
  "gadget" => ["cell phone", "walkie-talkie"]
}

extra_labels.keys.each do |category|
  extra_labels[category].each do |name|
    puts "Adding label '#{name}' of category '#{category}' to labels"
    Label.create(category: category, name: name)
    puts "Done!"
  end
end

Trip.destroy_all
puts "Cleaning Trips..."

# -------------------------------------------------------------
# Upcoming Trip 1
# -------------------------------------------------------------
trip = Trip.create!(
  {
    destination: "Ventana Big Sur. 48123 CA-1, Big Sur, CA 93920",
    description: "Big Sur, California",
    start_date: "Sep 15, 2021",
    end_date: "Sep 23, 2021",
    meetup_time: "9:00",
    expected_end_time: "23:00",
    finished: false,
    user_id: first.id
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
  {trip_id: trip.id, user_id: a.id},
  {trip_id: trip.id, user_id: b.id},
  {trip_id: trip.id, user_id: c.id},
  {trip_id: trip.id, user_id: d.id}
])

# Upcoming Trip 2
trip = Trip.create!(
  {
    destination: "Starved Rock Place, Huntley, Illinois, United States of America",
    description: "Starved Rock State Park",
    start_date: "May 10, 2021",
    end_date: "May 10, 2021",
    meetup_time: "8:00",
    expected_end_time: "12:00",
    finished: false,
    user_id: first.id
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

invitation2 = Invitation.create([
  {trip_id: trip.id, user_id: monica.id},
  {trip_id: trip.id, user_id: e.id}
])

# Past Trip
trip = Trip.create!(
  {
    destination: "Cave & Basin National Historic Site, Banff, Alberta, Canada",
    description: "Banff National Park",
    start_date: "Feb 10, 2021",
    end_date: "Feb 17, 2021",
    meetup_time: "10:00",
    expected_end_time: "19:00",
    finished: true,
    user_id: first.id
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
  {trip_id: trip.id, user_id: phoebe.id},
  {trip_id: trip.id, user_id: joey.id},
  {trip_id: trip.id, user_id: r.id},
  {trip_id: trip.id, user_id: s.id},
  {trip_id: trip.id, user_id: t.id},
  {trip_id: trip.id, user_id: u.id}
])

trip = Trip.create!(
  {
    destination: "Saint-Augustin-de-Woburn, Québec, Canada",
    description: "Mont Gosford via Frontier Trail SF6",
    start_date: "Apr 24, 2020",
    end_date: "Apr 29, 2020",
    meetup_time: "8:00",
    expected_end_time: "15:00",
    finished: true,
    user_id: first.id
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
  {trip_id: trip.id, user_id: f.id},
  {trip_id: trip.id, user_id: g.id},
  {trip_id: trip.id, user_id: h.id}
])

trip = Trip.create!(
  {
    destination: "Grand Canyon Village, Arizona, United States of America",
    description: "Grand Canyon National Park",
    start_date: "Sep 13, 2020",
    end_date: "Sep 20, 2020",
    meetup_time: "7:00",
    expected_end_time: "19:00",
    finished: true,
    user_id: first.id
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
  {trip_id: trip.id, user_id: chandler.id},
  {trip_id: trip.id, user_id: i.id},
  {trip_id: trip.id, user_id: j.id},
  {trip_id: trip.id, user_id: ross.id}
])

trip = Trip.create!(
  {
    destination: "Yellowstone Park, Beaumont, California, United States of America",
    description: "Yellowstone Park",
    start_date: "May 5, 2019",
    end_date: "May 10, 2019",
    meetup_time: "7:30",
    expected_end_time: "20:00",
    finished: true,
    user_id: first.id
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
  {trip_id: trip.id, user_id: k.id},
  {trip_id: trip.id, user_id: l.id},
  {trip_id: trip.id, user_id: m.id},
  {trip_id: trip.id, user_id: n.id},
  {trip_id: trip.id, user_id: o.id},
  {trip_id: trip.id, user_id: p.id},
  {trip_id: trip.id, user_id: q.id},
  {trip_id: trip.id, user_id: ross.id}
])

puts "Done with trips and activities create!"
