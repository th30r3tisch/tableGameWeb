# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
Game.destroy_all
game1 = Game.create(name: "GameNrOne", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 5, maxPlayer: 4, gameType: "strategy", releaseYear: 2001, pictureUrl: "http://via.placeholder.com/350x150" )

game2 = Game.create(name: "GameNrTwo", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 12, maxPlayer: 5, gameType: "fight", releaseYear: 2015, pictureUrl: "http://via.placeholder.com/150x150" )

game3 = Game.create(name: "GameNrThree", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 1, maxPlayer: 2, gameType: "family", releaseYear: 1990, pictureUrl: "http://via.placeholder.com/150x250" )
