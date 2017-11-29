class AdminsController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
	
	def index
    	@events = Event.all
  	end
	
	def show
	end
	
	def new
    	@admin = Admin.new
  	end
	
	def edit
  	end
	
	private
	# Use callbacks to share common setup or constraints between actions.
    def set_game
      	@game = Game.find(params["id"])
    end
	
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:admin).permit(:name, :email, :event_id)
    end

end
