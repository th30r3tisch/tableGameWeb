require 'rails_helper'

 describe 'the event page' do
  
   before :each do
	   
	    admin = FactoryBot.create(:admin)
   		login_as(admin, :scope => :admin)
	   
	    @game = Game.create(name: "GameNrOne", description: "here the game is explained and some more infos abaut how to play the game..", playtime: 5, maxPlayer: 4, gameType: "strategy", releaseYear: 2001, pictureUrl: "http://via.placeholder.com/350x150" )
	   
     	Event.create(name: "EventNrOne", description: "this is a description of an event etc. bla...", game: @game, ort: "hier", startDate:"01/12/2017 02:21", endDate:"01/12/2017 02:21")

	   	Event.create(name: "EventNrTwo", description: "this is a description of an event etc. bla...", game: @game, ort: "dort", startDate:"01/12/2017 02:21", endDate:"01/12/2017 02:21")

	   	Event.create(name: "EventNrThree", description: "this is a description of an event etc. bla...", game: @game, ort: "nirgendwo", startDate:"01/12/2017 02:21", endDate:"01/12/2017 02:21")
   end
 
   it 'shows the events' do
     visit events_path
     expect(page).to have_content('EventNrOne')
     expect(page).to have_content('EventNrTwo')
     expect(page).to have_content('EventNrThree')
   end
	 
   it "links to event details" do
	visit events_path
	first('tbody tr').click_link("Show")
 	expect(page).to have_content("EventNrOne")
   end
	 
   it "destroys a event" do
	visit events_path
 	expect {first('a[data-method="delete"]').click}.to change(Event, :count).by(-1)
   end
	 
 end