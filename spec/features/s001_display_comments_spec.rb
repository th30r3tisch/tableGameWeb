require 'rails_helper'

 describe 'the game detail page' do

   before :each do
      role = FactoryBot.create(:role)
	   	admin = FactoryBot.create(:admin)
	    login_as(admin, :scope => :admin)

      cat2 = CategoryTag.create(name: "Strategy", color: "red")
	    @game = Game.create(category_tag: cat2, name: "GameNrTwo", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 12, maxPlayer: 5, releaseYear: 2015, pictureUrl: "http://via.placeholder.com/150x150" )

      visit game_path(@game)
      within("#commentForm") do
        fill_in 'commentText', with: 'here the game1'
      end
      click_button 'Send'
   end

   it 'creates the comments' do
     visit game_path(@game)
     within("#commentForm") do
       fill_in 'commentText', with: 'here the game2'
     end
     click_button 'Send'
     expect(page).to have_content 'Comment was successfully created'
   end

   it 'shows the comments' do
     visit game_path(@game)
     expect(page).to have_content('here the game1')
   end

   it "destroys a comment" do
	    visit game_path(@game)
 	    expect {first('a[data-method="delete"]').click}.to change(Comment, :count).by(-1)
   end
 end
