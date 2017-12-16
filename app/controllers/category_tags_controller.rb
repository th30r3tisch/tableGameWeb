class CategoryTagsController < ApplicationController
  before_action :set_categoryTag, only: [:show, :edit, :update, :destroy]

  def index
    @categoryTags = CategoryTag.all
  end

  def show
  end

  def new
    @categoryTag = CategoryTag.new
  end

  def edit
  end

  def create
    @categoryTag = CategoryTag.new(categoryTag_params)

    respond_to do |format|
      if @categoryTag.save
        format.html { redirect_to @categoryTag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @categoryTag }
      else
        format.html { render :new }
        format.json { render json: @categoryTag.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @categoryTag.update(categoryTag_params)
        format.html { redirect_to @categoryTag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoryTag }
      else
        format.html { render :edit }
        format.json { render json: @categoryTag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @categoryTag.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_categoryTag
      	@categoryTag = CategoryTag.find(params["id"])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoryTag_params
      	params.require(:categoryTag).permit(:name, :color)
    end

end
