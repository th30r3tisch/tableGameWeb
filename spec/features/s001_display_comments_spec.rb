require 'rails_helper'

 describe 's001: the game detail page' do
   before :each do
	   	@game = Game.create(name: "GameNrFour", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 5, maxPlayer: 4, 		gameType: "strategy", releaseYear: 2001, pictureUrl: "http://via.placeholder.com/350x150" )
     	@game.comments.create(commenter: "pers1", body: "here the game1 is explained and some more infos abaut how to play the game..")

	   	@game.comments.create(commenter: "pers2", body: "here the game2 is explained and some more infos abaut how to play the game..")

   end
 
   it 'shows the comments' do
     visit game_path(@game) 
     expect(page).to have_content('Commenter: pers1')
     expect(page).to have_content('Commenter: pers2')
   end
	 
   it "destroys a comment" do
	visit game_path(@game)
 	expect {first('.deleteCommi').click}.to change(Comment, :count).by(-1)
   end
 end
