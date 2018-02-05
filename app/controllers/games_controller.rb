class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_admin!, only: [:index, :show, :filter]

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

  def filter

    @games = Game.where('playtime <= ?', "#{params[:play_time]}".to_i) if params[:play_time].length > 0
    @games = @games.where('"releaseYear" = ?', "#{params[:releaseYear]}".to_i) if params[:releaseYear].length > 0
    @games = @games.where('"maxPlayer" <= ?', "#{params[:max_player]}".to_i) if params[:max_player].length > 0
    @games = @games.where('"maxPlayer" >= ?', "#{params[:min_player]}".to_i) if params[:min_player].length > 0
    @games = @games.where('category_tag_id = ?', "#{params[:category_tag_id]}".to_i) if params[:category_tag_id].length > 0
    respond_to do |format|
      format.html { render action: "index" }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_game
      	@game = Game.find(params["id"])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      	params.require(:game).permit(:name, :description, :playtime, :maxPlayer, :releaseYear, :pictureUrl, :remove_pictureUrl, :category_tag_id)
    end

end
