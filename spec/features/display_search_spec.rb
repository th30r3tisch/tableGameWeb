require 'rails_helper'

 describe 'the search finds the' do

   before :each do
      role = FactoryBot.create(:role)
      admin = FactoryBot.create(:admin)
      login_as(admin, :scope => :admin)

     cat1 = CategoryTag.create(name: "Fight", color: "green")

     @game1 = Game.create(category_tag: cat1, name: "GameNrTwo", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 12, maxPlayer: 5, releaseYear: 2015, pictureUrl: "http://via.placeholder.com/150x150" )
     @game2 = Game.create(category_tag: cat1, name: "GameNrThree", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 1, maxPlayer: 2, releaseYear: 1990, pictureUrl: "http://via.placeholder.com/150x250" )
     @game3 = Game.create(category_tag: cat1, name: "GameNrFour", description: "here the game is explained and some more infos abaut how to play the game..special", playtime: 11, maxPlayer: 2, releaseYear: 1999, pictureUrl: "http://via.placeholder.com/150x250" )

	    Event.create(name: "EventNrOne", description: "this is a description of an event etc. bla...", game: @game1, ort: "hier", startDate:"01/12/2017 02:21", endDate:"01/12/2017 02:21", organizer: admin)
	   	Event.create(name: "EventNrTwo", description: "this is a description of an event etc. bla... hmm und hier", game: @game2, ort: "dort", startDate:"01/12/2017 02:21", endDate:"01/12/2017 02:21", organizer: admin)
	   	Event.create(name: "EventNrThree", description: "this is a description of an event etc. bla...", game: @game3, ort: "hier", startDate:"01/12/2017 02:21", endDate:"01/12/2017 02:21", organizer: admin)

   end

   it 'correct game names' do
      visit games_path
	    fill_in 'search', :with => 'GameNrTwo'
	    find('button[type="submit"]').click
      expect(page).to have_content('GameNrTwo')
   end

   # it "correct game types" do
	 #    visit games_path
	 #    fill_in 'search', :with => 'Fight'
	 #    find('button[type="submit"]').click
   #    expect(page).to have_content('GameNrFour')
   #    expect(page).to have_content('GameNrTwo')
   # end

   it "correct game descriptions" do
	    visit games_path
 	    fill_in 'search', :with => 'special'
	    find('button[type="submit"]').click
      expect(page).to have_content('GameNrFour')
   end

	it 'correct event names' do
     visit events_path
	   fill_in 'search', :with => 'EventNrOne'
	   find('button[type="submit"]').click
     expect(page).to have_content('EventNrOne')
   end

   it "correct event places" do
	    visit events_path
	    fill_in 'search', :with => 'hier'
	    find('button[type="submit"]').click
      expect(page).to have_content('EventNrOne')
      expect(page).to have_content('EventNrThree')
   end

   it "correct event descriptions" do
	   visit events_path
 	   fill_in 'search', :with => 'hmm und hier'
	   find('button[type="submit"]').click
     expect(page).to have_content('EventNrTwo')
   end

 end
