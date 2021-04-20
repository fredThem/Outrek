
@fake_users = [
  {
    "name": "Sasha Ho",
    "email": "sasha.ho@email.com",
    "position": "Administrative Assistant",
    "photo": "https:\/\/images.pexels.com\/photos\/415829\/pexels-photo-415829.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb"
  },
  {
    "name": "Giselle Franks",
    "email": "giselle.franks@email.com",
    "position": "Marketing",
    "photo": "https:\/\/images.generated.photos\/aNQYYS0hAZyxZ0qlqKbI-bERqUBV36z8xUK5jacrLEs\/rs:fit:512:512\/Z3M6Ly9nZW5lcmF0\/ZWQtcGhvdG9zLzA5\/OTk4ODIuanBn.jpg"
  },
  {
    "name": "Kent Sosa",
    "email": "kent.sosa@email.com",
    "position": "Administrative Assistant",
    "photo": "https:\/\/images.generated.photos\/z_w45-PQ28jY08f8O4BMykbnCVpwXsaoDvzoBgPYCg0\/rs:fit:512:512\/Z3M6Ly9nZW5lcmF0\/ZWQtcGhvdG9zL3Yy\/XzA4MzYxMDIuanBn.jpg"
  },
  {
    "name": "Jenil Gogari",
    "email": "jenil.gogari@email.com",
    "position": "Senior Developer",
    "photo": "https:\/\/uifaces.co\/our-content\/donated\/xB857nIu.jpg"
  },
  {
    "name": "Amiya Potts",
    "email": "amiya.potts@email.com",
    "position": "Accounting",
    "photo": "https:\/\/images.unsplash.com\/photo-1548537412-08ab4040f199?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
  },
  {
    "name": "Adolfo Hess",
    "email": "adolfo.hess@email.com",
    "position": "Sales",
    "photo": "https:\/\/images.generated.photos\/0PjDpiMOeF-HXb2lvBkGiApuNNESjm1YlhAMlJVT6PQ\/rs:fit:512:512\/Z3M6Ly9nZW5lcmF0\/ZWQtcGhvdG9zL3Yy\/XzA4MTg2OTYuanBn.jpg"
  },
  {
    "name": "Alex Diwa",
    "email": "alex.diwa@email.com",
    "position": "Call Center Representative",
    "photo": "https:\/\/uifaces.co\/our-content\/donated\/0VZ0boL5.png"
  },
  {
    "name": "Mary Mart\u00c3\u00adnez",
    "email": "mary.mart\u00c3\u00adnez@email.com",
    "position": "Part Time",
    "photo": "https:\/\/uifaces.co\/our-content\/donated\/Zh_4oc5l.jpg"
  }
]

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