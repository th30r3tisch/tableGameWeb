# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
['banned', 'user', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

Admin.destroy_all
user = Admin.new
user.email = 'user@test.de'
user.password = 'user1234'
user.password_confirmation = 'user1234'
user.nickname = 'userNick'
user.role_id = 2
user.save!

admin = Admin.new
admin.email = 'admin@test.de'
admin.password = 'admin1234'
admin.password_confirmation = 'admin1234'
admin.nickname = 'adminNick'
admin.role_id = 3
admin.save!

CategoryTag.destroy_all
cat1 = CategoryTag.create(name: "Fight", color: "green")
cat2 = CategoryTag.create(name: "Strategy", color: "red")

Game.destroy_all
game1 = Game.create(category_tag: cat1, name: "GameNrOne", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 5, maxPlayer: 4, releaseYear: 2001, pictureUrl: "http://via.placeholder.com/350x150" )
Game.create(category_tag: cat2, name: "GameNrTwo", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 12, maxPlayer: 5, releaseYear: 2015, pictureUrl: "http://via.placeholder.com/150x150" )
Game.create(category_tag: cat1, name: "GameNrThree", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 1, maxPlayer: 2, releaseYear: 1990, pictureUrl: "http://via.placeholder.com/150x250" )
Game.create(category_tag: cat2, name: "GameNrFour", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 11, maxPlayer: 2, releaseYear: 1999, pictureUrl: "http://via.placeholder.com/150x250" )

Comment.destroy_all
Comment.create(commenter: user.nickname, body: "this is a comment", game: game1, author: user)

Event.destroy_all
Event.create(name: "EventNrOne", description: "here are some infos about the eventOne", ort: "nowhere", startDate: DateTime.new(2018,2,2,10,0), endDate: DateTime.new(2018,3,2,10,0), game: game1, organizer: admin)
Event.create(name: "EventNrTwo", description: "here are some infos about the eventTwo", ort: "here", startDate: DateTime.new(2018,3,2,10,0), endDate: DateTime.new(2018,4,2,10,0), game: game1, organizer: user)
