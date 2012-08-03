class TourismLocationsController < ApplicationController
  load_and_authorize_resource
  impressionist
  
  def index
    if params[:category_loc_tourism_id].present?
      @category_loc_tourism = CategoryLocTourism.find(params[:category_loc_tourism_id])
      category_loc_tourism_ids = [@category_loc_tourism.id] + @category_loc_tourism.descendants.map(&:id)
      @tourism_locations = @tourism_locations.where(category_loc_tourism_id: category_loc_tourism_ids)
    end

    @tourism_locations = @tourism_locations.published.recent.page(params[:page]).per(12)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tourism_locations }
    end
  end

  def show
    @comments = @tourism_location.comments.published.recent.page(params[:page]).per(10)
    first_comment = @tourism_location.comments.published.recent.last
    @first_commentator = first_comment.user if first_comment
    
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tourism_location }
    end
  end

  def create_comment
    @comment = current_user.comments.new(params[:comment])
    @comment.commentable = @tourism_location

    if @comment.save
      redirect_to @tourism_location, notice: 'cerita sukses dibuat, menunggu verifikasi admin'
    else
      #       render action: "show"
      redirect_to @tourism_location, notice: 'cerita gagal dibuat, form komentar kosong'
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tourism_location }
    end
  end

  def create
    @tourism_location = current_user.tourism_locations.new(params[:tourism_location])

    respond_to do |format|
      if @tourism_location.save
        format.html { redirect_to @tourism_location, notice: 'Tempat wisata sukses dibuat, menunggu verifikasi admin' }
        format.json { render json: @tourism_location, status: :created, location: @tourism_location }
      else
        format.html { render action: "new" }
        format.json { render json: @tourism_location.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    tourism_location = @tourism_location
    @tourism_location = current_user.tourism_location_revisions.new(params[:tourism_location])
    @tourism_location.tourism_location = tourism_location
    @tourism_location.copy_fields
  end

  def update
    tourism_location = @tourism_location
    @tourism_location = current_user.tourism_location_revisions.new(params[:tourism_location])
    @tourism_location.tourism_location = tourism_location
    
    respond_to do |format|
      if @tourism_location.save
        format.html { redirect_to @tourism_location.tourism_location, notice: 'Tempat wisata sukses diperbaharui, menunggu verifikasi admin' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tourism_location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tourism_location.destroy

    respond_to do |format|
      format.html { redirect_to tourism_locations_url }
      format.json { head :no_content }
    end
  end
end