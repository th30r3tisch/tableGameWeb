class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :register, :leave]
  skip_before_action :authenticate_admin!, only: [:index, :show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
	  if params[:search]
		  @events = Event.where('lower(name) LIKE ? OR lower(description) LIKE ? OR lower("ort") LIKE ?',
			  "%#{params[:search].downcase}%", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
	  end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @participants = @event.admins
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.organizer = current_admin

    respond_to do |format|
      if @event.save
		    @event.admins << current_admin
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def register
     @maxParticipants = @event.max_participants
     @participants = @event.admins
     if @maxParticipants == nil || @participants.length < @maxParticipants
       if @event.admins.exists?(current_admin.id)
         respond_to do |format|
           format.html { redirect_to @event, notice: 'You are already registered' }
           format.json { head :no_content }
         end
       else
         @event.admins << current_admin
         respond_to do |format|
           format.html { redirect_to @event, notice: 'You participate.' }
           format.json { head :no_content }
         end
       end
     end
  end

  def leave
    @event.admins.delete(current_admin)
    respond_to do |format|
      format.html { redirect_to @event, notice: 'You left.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :startDate, :endDate, :description, :ort, :game_id, :max_participants, :public)
    end
end
