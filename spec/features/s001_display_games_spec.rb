require 'rails_helper'

 describe 'the start page' do

   before :each do
     cat1 = CategoryTag.create(name: "Fight", color: "green")
     cat2 = CategoryTag.create(name: "Strategy", color: "red")
     Game.create(category_tag: cat2, name: "GameNrTwo", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 12, maxPlayer: 5, releaseYear: 2015, pictureUrl: "http://via.placeholder.com/150x150" )
     Game.create(category_tag: cat1, name: "GameNrThree", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 1, maxPlayer: 2, releaseYear: 1990, pictureUrl: "http://via.placeholder.com/150x250" )
     Game.create(category_tag: cat2, name: "GameNrFour", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 11, maxPlayer: 2, releaseYear: 1999, pictureUrl: "http://via.placeholder.com/150x250" )

      role = FactoryBot.create(:role)
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

   # cant be tested because its not possible to give the user the admin role
   #it "destroys a game" do
   # visit games_path
   # expect {find('a[data-method="delete"]').click}.to change(Game, :count).by(-1)
   #end

   it "creates a game" do
     visit root_path
     click_link "New Game"
     within("#content form") do
       fill_in 'Name', with: 'TestGame'
       fill_in 'Description', with: 'This is a test description'
       fill_in 'Playtime', with: '8'
       fill_in 'Maxplayer', with: '15'
       select "Fight", :from => 'game[category_tag_id]'
       fill_in 'Releaseyear', with: '2015'
     end
     click_button 'Speichern'
     expect(page).to have_content("TestGame")
   end

   it "filter games" do
     visit root_path
     within("#filter form") do
       fill_in 'Play time', with: '11'
       fill_in 'Releaseyear', with: '1990'
     end
     click_on 'Filter'
     expect(page).to have_content("GameNrThree")
     expect(page).not_to have_content("GameNrFour")
     expect(page).not_to have_content("GameNrTwo")
   end

 end
