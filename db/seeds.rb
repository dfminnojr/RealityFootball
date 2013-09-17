# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



u1 = User.create(username: "Brady's Bunch",
                 email: "davidmferris@gmail.com",
                 password: "password",
                 password_confirmation: "password",
                 picture: "http://placekitten.com/200/200",
                 rank: "Rookie",
                 point_amount: 20000,
                 admin: true )

u2 = User.create(username: "Lions fan kill me",
                 email: "davidmferris@hotmail.com",
                 password: "password",
                 password_confirmation: "password",
                 picture: "http://placekitten.com/220/200",
                 rank: "Pop Warner",
                 point_amount: 1500 )

u3 = User.create(username: "rick",
                 email: "dfminnojr@yahoo.com",
                 password: "password",
                 password_confirmation: "password",
                 picture: "http://placekitten.com/220/200",
                 rank: "Pro",
                 point_amount: 200000,
                 admin: true )

u1 = User.create(username: "dave",
                 email: "davidmferris@gmail.com",
                 password: "password",
                 password_confirmation: "password",
                 picture: "http://placekitten.com/200/200",
                 rank: "Rookie",
                 point_amount: 20000,
                 admin: true )

u4 = User.create(username: "LambeauLeaper",
                 email: "thepack@yahoo.com",
                 password: "password",
                 password_confirmation: "password",
                 picture: "http://placekitten.com/220/200",
                 rank: "All-Pro",
                 point_amount: 15000 )

u5 = User.create(username: "MakingItRain",
                 email: "steelcurtain@gmail.com",
                 password: "password",
                 password_confirmation: "password",
                 picture: "http://placekitten.com/220/200",
                 rank: "Hall of Fame",
                 point_amount: 26000 )

u6 = User.create(username: "LaCruzLaSalsa",
                 email: "gmen@gmail.com",
                 password: "password",
                 password_confirmation: "password",
                 picture: "http://placekitten.com/220/200",
                 rank: "Hall of Fame",
                 point_amount: 36575 )

