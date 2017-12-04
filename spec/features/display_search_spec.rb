require 'rails_helper'

 describe 'the search finds the' do
  
   before :each do
	   
	    @game1 = Game.create(name: "GameNrFour", description: "here the game is explained and some more infos abaut how to play the game.. special", playtime: 5, maxPlayer: 4, gameType: "strategy", releaseYear: 2001, pictureUrl: "http://via.placeholder.com/350x150" )
	   
     	@game2 = Game.create(name: "GameNrOne", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 5, maxPlayer: 4, gameType: "strategy", releaseYear: 2001, pictureUrl: "http://via.placeholder.com/350x150" )

	   	@game3 = Game.create(name: "GameNrTwo", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 12, maxPlayer: 5, gameType: "fight", releaseYear: 2015, pictureUrl: "http://via.placeholder.com/150x150" )
	   
	    Event.create(name: "EventNrOne", description: "this is a description of an event etc. bla...", game: @game1, ort: "hier", startDate:"01/12/2017 02:21", endDate:"01/12/2017 02:21")

	   	Event.create(name: "EventNrTwo", description: "this is a description of an event etc. bla... hmm und hier", game: @game2, ort: "dort", startDate:"01/12/2017 02:21", endDate:"01/12/2017 02:21")

	   	Event.create(name: "EventNrThree", description: "this is a description of an event etc. bla...", game: @game3, ort: "hier", startDate:"01/12/2017 02:21", endDate:"01/12/2017 02:21")

   end
 
   it 'correct game names' do
     visit games_path
	 fill_in 'search', :with => 'GameNrTwo'
	 find('button[type="submit"]').click
     expect(page).to have_content('GameNrTwo')
   end
	 
   it "correct game types" do
	visit games_path
	fill_in 'search', :with => 'strategy'
	find('button[type="submit"]').click
    expect(page).to have_content('GameNrFour')
    expect(page).to have_content('GameNrOne')
   end
	 
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