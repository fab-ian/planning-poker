User.destroy_all

User.create(name: 'Admin', surname: 'Adminski', email: 'admin@admin.com', password:'adminadmin', role: 'admin')

10.times do 
  User.create!(name: Faker::Name.first_name, surname: Faker::Name.last_name,
   email: Faker::Name.first_name + '@pk.com', password:'player16', role: 'player')
end

p 'seeds created.'
