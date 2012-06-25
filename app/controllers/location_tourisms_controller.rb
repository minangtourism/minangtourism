class LocationTourismsController < ApplicationController
  load_and_authorize_resource
  # GET /location_tourisms
  # GET /location_tourisms.json
  def index
    if params[:category_loc_tourism_id].present?
      @category_loc_tourism = CategoryLocTourism.find(params[:category_loc_tourism_id])
      category_loc_tourism_ids = [@category_loc_tourism.id] + @category_loc_tourism.descendants.map(&:id)
      @location_tourisms = @location_tourisms.where(category_loc_tourism_id: category_loc_tourism_ids)
    end
    @location_tourisms = @location_tourisms.order("created_at desc").page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_tourisms }
    end
  end

  # GET /location_tourisms/1
  # GET /location_tourisms/1.json
  def show
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_tourism }
    end
  end

  def create_comment
    @comment = current_user.comments.new(params[:comment])
    @comment.commentable = @location_tourism

    if @comment.save
      redirect_to @location_tourism
    else
      render action: "show"
    end
  end

  # GET /location_tourisms/new
  # GET /location_tourisms/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_tourism }
    end
  end

  # GET /location_tourisms/1/edit
  def edit
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
    @location_tourism.destroy

    respond_to do |format|
      format.html { redirect_to location_tourisms_url }
      format.json { head :no_content }
    end
  end
end
