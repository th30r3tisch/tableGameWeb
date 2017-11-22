class CommentsController < ApplicationController
	skip_before_action :authenticate_admin!, only: []
	
	def create
    	@game = Game.find(params[:idG])
    	@comment = @game.comments.create(comment_params)
		
		#@admin = Admin.find(params[:idU])
		#@comment = @admin.comments.create(comment_params)
    	redirect_to game_path(@game)
  	end
 
	def destroy
    	@game = Game.find(params[:idG])
    	@comment = @game.comments.find(params[:id])
    	@comment.destroy
    	redirect_to game_path(@game)
  	end
	
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
	
end
