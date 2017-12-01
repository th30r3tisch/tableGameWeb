require 'rails_helper'

 describe 'the game detail page' do
   
   before :each do
	   	admin = FactoryBot.create(:admin)
	    login_as(admin, :scope => :admin)
	   
	   	@game = Game.create(name: "GameNrFour", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 5, maxPlayer: 4, 	gameType: "strategy", releaseYear: 2001, pictureUrl: "http://via.placeholder.com/350x150" )
	   
     	@game.comments.create(body: "here the game1 is explained and some more infos abaut how to play the game..")

	   	@game.comments.create(body: "here the game2 is explained and some more infos abaut how to play the game..")
	
   end
 
   it 'shows the comments' do
     visit game_path(@game) 
     expect(page).to have_content('here the game1')
     expect(page).to have_content('here the game2')
   end
	 
   it "destroys a comment" do
	visit game_path(@game)
 	expect {first('a[data-method="delete"]').click}.to change(Comment, :count).by(-1)
   end
 end
