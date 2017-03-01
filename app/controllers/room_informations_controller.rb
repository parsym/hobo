class RoomInformationsController < ApplicationController
  before_action :set_room_information, only: [:show, :edit, :update, :destroy]
  before_action :check_if_logged_in_user_is_admin

  # GET /room_informations
  # GET /room_informations.json
  def index
    @room_informations = RoomInformation.all
  end

  # GET /room_informations/1
  # GET /room_informations/1.json
  def show
  end

  # GET /room_informations/new
  def new
    @room_information = RoomInformation.new
  end

  # GET /room_informations/1/edit
  def edit
  end

  # POST /room_informations
  # POST /room_informations.json
  def create
    @room_information = RoomInformation.new(room_information_params)

    respond_to do |format|
      if @room_information.save
        format.html { redirect_to @room_information, notice: 'Room information was successfully created.' }
        format.json { render :show, status: :created, location: @room_information }
      else
        format.html { render :new }
        format.json { render json: @room_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_informations/1
  # PATCH/PUT /room_informations/1.json
  def update
    respond_to do |format|
      if @room_information.update(room_information_params)
        format.html { redirect_to @room_information, notice: 'Room information was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_information }
      else
        format.html { render :edit }
        format.json { render json: @room_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_informations/1
  # DELETE /room_informations/1.json
  def destroy
    @room_information.destroy

    respond_to do |format|
      if room_information_destroyed?
        format.html { redirect_to room_informations_url, notice: "Rooms information/type was destroyed" }
        format.json { head :no_content }
      else
        format.html { redirect_to room_informations_url, 
                      alert: "Rooms information/type was not destroyed; try deleting dependant rooms first" }
      end
    end
  end

  private

    #check if the room information was sucessfully destroyed
    def room_information_destroyed?
      if RoomInformation.find_by_id(params[:id])
        return false
      else
        return true
      end
    end



    # Use callbacks to share common setup or constraints between actions.
    def set_room_information
      @room_information = RoomInformation.find(params[:id])
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    
    def room_information_params
      params.require(:room_information).permit(:room_type, :description, :price)
    end

end
