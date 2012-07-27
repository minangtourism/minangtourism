class CategoryLocTourismsController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @category_loc_tourisms }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category_loc_tourism }
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category_loc_tourism }
    end
  end

  def edit
  end

  def create
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

  def update
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

  def destroy
    @category_loc_tourism.destroy
    respond_to do |format|
      format.html { redirect_to category_loc_tourisms_url }
      format.json { head :no_content }
    end
  end
end
