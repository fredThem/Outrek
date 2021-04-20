# activities = [
# Camping: [],
# Hiking: [],
# Climbing: [],
# Cycling: [],
# Paddling: [],
# Fitness: [],
# Snowsports: [],
# Travel: [],
# Clothing: [],
# Family: [],
# Basics: [],
# ]





"Canoeing"
"Kayaking"
"Standup paddleboarding"

curation = [

    "Canoeing": { # activity object
      "FORMALITIES": { #label object
        "Stay permit" #curated checklist item with
        "Access permit"
      },
      "SAFETY AND COMMUNICATION": { 
        
      }
    },
    "Kayaking",
    "Standup paddleboarding",

  # "Backpacking",
  # "Bike Touring",
  # "Bird Watching",
  # "Dog Walking",
  # "Camping",
  # "Cross Country Skiing",
  # "Fishing",
  # "Hiking",
  # "Horseback Riding",
  # "Mountain Biking",
  # "Nature Trips",
  # "Photography",
  "Paddle Sports": [
    "Canoeing", 
    "Kayaking",
    "Standup paddleboarding",
  ],
  "Biking": [
    "Road Biking",
    "Kayaking",
    "Standup paddleboarding",
  ],
  "Climbing": [ # FOR FUTURE IMPLEMENTATION
    "Bouldering", # activity
    "Ice Climbing": { # activity
      "FORMALITIES": {
        "Stay permit"
        "Access permit"
      },
      "SAFETY AND COMMUNICATION": { 
        
      }
      
    }, # https://www.vertical-addiction.com/us/blogs/blog/ice-climbing-packing-list-the-essentials/
    "Sport Climbing", # https://www.rei.com/learn/expert-advice/sport-climbing-checklist.html
    "Trad Climbing", # https://www.rei.com/learn/expert-advice/climbing-trad-checklist.html?cm_mmc=sm_pin-_-outside-everyday&crlt.pid=camp.2RkFP5ynxPDl
    # "Rock Climbing",
  ],
  # "Rock Climbing",
  # "Scenic Driving",
  # "Skiing",
  # "Snowshoeing",
  # "Trail Running",
]


curated.each do |curate|
  puts "Adding the activity #{activity}"

  Activity.create!(name: activity)
  puts "Added #{activity}!"
end



curation.keys.each do |category|
  labels[category].each do |name|
    puts "Adding label '#{name}' of category '#{category}' to labels"
    Label.create(category: category, name: name)
    puts "Done!"
  end
end








puts "cleaning activities..."
Activity.destroy_all

activities.each do |activity|
  puts "Adding the activity #{activity}"
  Activity.create!(name: activity)
  puts "Added #{activity}!"
end