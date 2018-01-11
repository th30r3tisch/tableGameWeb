class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_admin!, only: [:index, :show]

  # GET /games
  # GET /games.json
  def index
	  if params[:search]
		  @games = Game.where('lower(name) LIKE ? OR lower(description) LIKE ?',
			  "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
        respond_to do |f|
          f.js
          f.html
        end
	  else
      @games = Game.all
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        if params[:remove_pictureUrl]
          @game.remove_pictureUrl!
          @game.save
        end
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

	# does not work
	#def self.search(search)
  	#	where("name LIKE ? OR gameType LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	#end

    # Use callbacks to share common setup or constraints between actions.
    def set_game
      	@game = Game.find(params["id"])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      	params.require(:game).permit(:name, :description, :playtime, :maxPlayer, :releaseYear, :pictureUrl, :remove_pictureUrl, :category_tag_id)
    end

	# does not work
	#def search_params
	#	params.require(:search).permit(:name, :description, :gameType)
	#end
end
