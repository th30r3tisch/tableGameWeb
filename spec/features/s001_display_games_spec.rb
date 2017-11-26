require 'rails_helper'

 describe 'the start page' do
  
   before :each do
     	Game.create(name: "GameNrOne", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 5, maxPlayer: 4, gameType: "strategy", releaseYear: 2001, pictureUrl: "http://via.placeholder.com/350x150" )

	   	Game.create(name: "GameNrTwo", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 12, maxPlayer: 5, gameType: "fight", releaseYear: 2015, pictureUrl: "http://via.placeholder.com/150x150" )

	   	Game.create(name: "GameNrThree", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 1, maxPlayer: 2, gameType: "family", releaseYear: 1990, pictureUrl: "http://via.placeholder.com/150x250" )
	   
	    admin = FactoryBot.create(:admin)
   		login_as(admin, :scope => :admin)
   end
 
   it 'shows the games' do
     visit root_path
     expect(page).to have_content('GameNrOne')
     expect(page).to have_content('GameNrTwo')
     expect(page).to have_content('GameNrThree')
   end
	 
   it "links to games details" do
	visit root_path
	first('.gamePic').click
 	expect(page).to have_content("GameNrOne")
   end
	 
   it "destroys a game" do
	visit root_path
 	expect {first('a[data-method="delete"]').click }.to change(Game, :count).by(-1)
   end
	 
 end