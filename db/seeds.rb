# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
['banned', 'user', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

CategoryTag.destroy_all
cat1 = CategoryTag.create(name: "Fight", color: "green")
cat2 = CategoryTag.create(name: "Strategy", color: "red")

Game.destroy_all
game1 = Game.create(category_tag: cat1, name: "GameNrOne", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 5, maxPlayer: 4, releaseYear: 2001, pictureUrl: "http://via.placeholder.com/350x150" )
Game.create(category_tag: cat2, name: "GameNrTwo", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 12, maxPlayer: 5, releaseYear: 2015, pictureUrl: "http://via.placeholder.com/150x150" )
Game.create(category_tag: cat1, name: "GameNrThree", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 1, maxPlayer: 2, releaseYear: 1990, pictureUrl: "http://via.placeholder.com/150x250" )
Game.create(category_tag: cat2, name: "GameNrFour", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 11, maxPlayer: 2, releaseYear: 1999, pictureUrl: "http://via.placeholder.com/150x250" )

Event.destroy_all
Event.create(name: "EventNrOne", description: "here are some infos about the event", ort: "nowhere", startDate: DateTime.new(2018,2,2,10,0), endDate: DateTime.new(2018,3,2,10,0), game: game1)
