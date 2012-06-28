class CategoryLocTourismsController < ApplicationController
  load_and_authorize_resource
  # GET /category_loc_tourisms
  # GET /category_loc_tourisms.json
  def index
#    @category_loc_tourisms = CategoryLocTourism.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @category_loc_tourisms }
    end
  end

  # GET /category_loc_tourisms/1
  # GET /category_loc_tourisms/1.json
  def show
#    @category_loc_tourism = CategoryLocTourism.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category_loc_tourism }
    end
  end

  # GET /category_loc_tourisms/new
  # GET /category_loc_tourisms/new.json
  def new
#    @category_loc_tourism = CategoryLocTourism.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category_loc_tourism }
    end
  end

  # GET /category_loc_tourisms/1/edit
  def edit
#    @category_loc_tourism = CategoryLocTourism.find(params[:id])
  end

  # POST /category_loc_tourisms
  # POST /category_loc_tourisms.json
  def create
#    @category_loc_tourism = CategoryLocTourism.new(params[:category_loc_tourism])

    respond_to do |format|
      if @category_loc_tourism.save
        format.html { redirect_to @category_loc_tourism, notice: 'Category loc tourism was successfully created.' }
        format.json { render json: @category_loc_tourism, status: :created, location: @category_loc_tourism }
      else
        format.html { render action: "new" }
        format.json { render json: @category_loc_tourism.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /category_loc_tourisms/1
  # PUT /category_loc_tourisms/1.json
  def update
#    @category_loc_tourism = CategoryLocTourism.find(params[:id])

    respond_to do |format|
      if @category_loc_tourism.update_attributes(params[:category_loc_tourism])
        format.html { redirect_to @category_loc_tourism, notice: 'Category loc tourism was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category_loc_tourism.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_loc_tourisms/1
  # DELETE /category_loc_tourisms/1.json
  def destroy
#    @category_loc_tourism = CategoryLocTourism.find(params[:id])
    @category_loc_tourism.destroy

    respond_to do |format|
      format.html { redirect_to category_loc_tourisms_url }
      format.json { head :no_content }
    end
  end
end
