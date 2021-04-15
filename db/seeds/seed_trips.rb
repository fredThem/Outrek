
@fake_trips = [
  {
    destination: "Ventana Big Sur. 48123 CA-1, Big Sur, CA 93920",
    description: "Big Sur, California",
    # start_date: "Sep 15, 2021", ## randomize
    # end_date: "Sep 23, 2021", ## start_date + rand(-10..10) if < 0 trip has no end date
    # meetup_time: "9:00", ## randomize from 4:30AM to 3pm
    # expected_end_time: "23:00", ## randomize from 3PM to 11:45pm
    finished: false,
    # user_id: jane.id ## user.find(rand(User.all.size))
    label: ["ski"] ## 
  },
]








@fake_trips.each 


















@fake_users_created = []
def seed_users
  p @fake_users
    puts "__________________"
  puts "Clearing all #{@fake_users_created.count} fake users from User database..."
  puts "__________________"
  @fake_users_created.each do |usr|
    Trip.where(user_id: usr.id).each do |trip|
      trip.destroy
    end
    usr.destroy
  end
  @fake_users_created = []

  # Equipment.destroy_all
  User.destroy_all
  puts "creating #{@fake_users.size} new users"

  @fake_users.each do |fake_user|
    file = URI.open(fake_user[:photo])
    # binding.pry
    name = NameOfPerson::PersonName.full(fake_user[:name])
    new_user = User.create(
      email: fake_user[:email], 
      first_name: name.first,
      last_name: name.last,
      password: "fakeuser1234")
    new_user.avatar.attach(io: file, filename: "user_avatar.png", content_type: 'image/png')

    @fake_users_created << new_user

  end
  # puts User.all
  User.all.each do |user|
    puts user.name
    puts user.email
    puts "user has an avatar : #{User.first.avatar.attached?}"
    p "\n"
  end
  # puts @fake_users_created

  # seed_equipment_enhanced(@fake_users_created)
end