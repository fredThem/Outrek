activities = [
  'biking',
  'camping',
  'canoeing',
  'fishing',
  'hiking',
  'horseback riding',
  'hunting',
  'kayaking',
  'motorboating',
  'rafting',
  'rock climbing',
  'sailing',
  'skiing'
]

[
"Hiking",
"Mountain Biking",
"Trail Running",
"Backpacking",
"Walking",
"Road Biking",
"Off Road Driving",
"Camping",
"Bird Watching",
"Horseback Riding",
"Nature Trips",
"Fishing",
"Snowshoeing",
"Scenic Driving",
"Rock Climbing",
"Paddle Sports",
"Cross Country Skiing",
"Skiing",
"Bike Touring",
"Via Ferrata"
]


puts "cleaning activities..."
Activity.destroy_all

activities.each do |activity|
  puts "Adding the activity #{activity}"
  Activity.create!(name: activity)
  puts "Added #{activity}!"
end