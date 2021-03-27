Item.destroy_all
Label.destroy_all
User.destroy_all

user = User.create!(email: 'a@a.com', password: '123456')
label = Label.create!(name: 'boots', category: 'hiking')
item = Item.new(name: 'boots')
item.user = user
item.label = label
item.save!
