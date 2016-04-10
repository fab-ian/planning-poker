$GAMES = 0
$USERS = 0

Assignment.destroy_all
GameUser.destroy_all
Game.destroy_all
User.destroy_all
Role.destroy_all

r1 = Role.create(name: 'admin')
r2 = Role.create(name: 'user')

u = User.create(name: 'Admin', surname: 'Adminski', email: 'admin@admin.com', password:'adminadmin')
Assignment.create(user: u, role: r1)
Assignment.create(user: u, role: r2)

10.times do 
  first_name = Faker::Name.first_name

  u_curr = User.create!(name: first_name, surname: Faker::Name.last_name,
   email: first_name + '@pk.com', password:'player16')
  Assignment.create(user: u_curr, role: r2)
end

g = Game.create!(name: 'Another Game', content:'Description for another game',
  status: 'active', user_id: 1 )

GameUser.create!(user_id: 1, game: g, score: 56)
GameUser.create!(user_id: 6, game: g, score: 34)
GameUser.create!(user_id: 7, game: g, score: 34)

g = Game.create!(name: 'Game from non-admin player', content:'Your description :)',
  status: 'active', user_id: 2 )

GameUser.create!(user_id: 1, game: g, score: 56)
GameUser.create!(user_id: 4, game: g, score: 34)
GameUser.create!(user_id: 3, game: g, score: 34)

g = Game.create!(name: 'Last inactive Game', content:'Description for inactive game',
  status: 'new', user_id: 1 )

GameUser.create!(user_id: 1, game: g, score: 8)
GameUser.create!(user_id: 3, game: g, score: 13)

g = Game.create!(name: 'To be, or not to be... a RoR programmer?', content:'Writing a novel for RoR developers...',
  status: 'active', user_id: 1 )

GameUser.create!(user_id: 1, game: g, score: 56)
GameUser.create!(user_id: 2, game: g, score: 34)
GameUser.create!(user_id: 3, game: g, score: 34)
GameUser.create!(user_id: 4, game: g, score: 34)
GameUser.create!(user_id: 5, game: g, score: 34)
GameUser.create!(user_id: 6, game: g, score: 21)
GameUser.create!(user_id: 7, game: g, score: 21)
GameUser.create!(user_id: 8, game: g, score: 13)
GameUser.create!(user_id: 9, game: g, score: 8)

p 'seeds created.'
