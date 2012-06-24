class LocationTourismsController < ApplicationController
  # GET /location_tourisms
  # GET /location_tourisms.json
  def index
    #    @location_tourisms = LocationTourism.all
    @location_tourisms = LocationTourism.order("created_at desc").page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_tourisms }
    end
  end

  # GET /location_tourisms/1
  # GET /location_tourisms/1.json
  def show
    @location_tourism = LocationTourism.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_tourism }
    end
  end

  # GET /location_tourisms/new
  # GET /location_tourisms/new.json
  def new
    @location_tourism = LocationTourism.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_tourism }
    end
  end

  # GET /location_tourisms/1/edit
  def edit
    @location_tourism = LocationTourism.find(params[:id])
  end

  # POST /location_tourisms
  # POST /location_tourisms.json
  def create
    @location_tourism = current_user.location_tourisms.new(params[:location_tourism])

    respond_to do |format|
      if @location_tourism.save
        format.html { redirect_to @location_tourism, notice: 'Location tourism was successfully created.' }
        format.json { render json: @location_tourism, status: :created, location: @location_tourism }
      else
        format.html { render action: "new" }
        format.json { render json: @location_tourism.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /location_tourisms/1
  # PUT /location_tourisms/1.json
  def update
    @location_tourism = LocationTourism.find(params[:id])

    respond_to do |format|
      if @location_tourism.update_attributes(params[:location_tourism])
        format.html { redirect_to @location_tourism, notice: 'Location tourism was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_tourism.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_tourisms/1
  # DELETE /location_tourisms/1.json
  def destroy
    @location_tourism = LocationTourism.find(params[:id])
    @location_tourism.destroy

    respond_to do |format|
      format.html { redirect_to location_tourisms_url }
      format.json { head :no_content }
    end
  end
end
