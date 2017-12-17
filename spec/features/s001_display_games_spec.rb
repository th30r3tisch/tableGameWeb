require 'rails_helper'

 describe 'the start page' do

   before :each do
     ['user', 'admin'].each do |role|
       Role.find_or_create_by({name: role})
     end
     cat1 = CategoryTag.create(name: "Fight", color: "green")
     cat2 = CategoryTag.create(name: "Strategy", color: "red")
     Game.create(category_tag: cat2, name: "GameNrTwo", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 12, maxPlayer: 5, releaseYear: 2015, pictureUrl: "http://via.placeholder.com/150x150" )
     Game.create(category_tag: cat1, name: "GameNrThree", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 1, maxPlayer: 2, releaseYear: 1990, pictureUrl: "http://via.placeholder.com/150x250" )
     Game.create(category_tag: cat2, name: "GameNrFour", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 11, maxPlayer: 2, releaseYear: 1999, pictureUrl: "http://via.placeholder.com/150x250" )

	    admin = FactoryBot.create(:admin)
   		login_as(admin, :scope => :admin)
   end

   it 'shows the games' do
     visit root_path
     expect(page).to have_content('GameNrFour')
     expect(page).to have_content('GameNrTwo')
     expect(page).to have_content('GameNrThree')
   end

   it "links to games details" do
	visit root_path
	first('.gamePic').click
 	expect(page).to have_content("GameNrTwo")
   end

   it "destroys a game" do
	visit root_path
 	expect {first('a[data-method="delete"]').click }.to change(Game, :count).by(-1)
   end

 end
