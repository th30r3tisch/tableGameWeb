class CommentsController < ApplicationController
	before_action :set_game, only: [:create, :destroy]
	skip_before_action :authenticate_admin!, only: []


	def create
		@comment = @game.comments.create(comment_params)
		@comment.author = current_admin
		@comment.commenter = current_admin.nickname

    	respond_to do |format|
			if @comment.save
				format.html { redirect_to game_path(@game), notice: 'Comment was successfully created.' }
			else
				format.html { redirect_to game_path(@game), alert: 'Comment was not created.' }
			end
    	end
	end


	def destroy
    @comment = @game.comments.find(params[:id])
		respond_to do |format|
			if @comment.destroy
				format.html { redirect_to game_path(@game), notice: 'Comment was successfully deleted.' }
			else
				format.html { redirect_to game_path(@game), alert: 'Comment was not deleted.' }
			end
		end
  	end


  private
	def set_game
      @game = Game.find(params["game_id"])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

end
