class LocationTourismsController < ApplicationController
  load_and_authorize_resource
  impressionist
  
  def index
    if params[:category_loc_tourism_id].present?
      @category_loc_tourism = CategoryLocTourism.find(params[:category_loc_tourism_id])
      category_loc_tourism_ids = [@category_loc_tourism.id] + @category_loc_tourism.descendants.map(&:id)
      @location_tourisms = @location_tourisms.where(category_loc_tourism_id: category_loc_tourism_ids)
    end

    @location_tourisms = @location_tourisms.published.recent.page(params[:page]).per(12)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_tourisms }
    end
  end

  def show
    @comments = @location_tourism.comments.published.recent.page(params[:page]).per(10)
    first_comment = @location_tourism.comments.published.recent.last
    @first_commentator = first_comment.user if first_comment
    
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
      redirect_to @location_tourism, notice: 'cerita sukses dibuat, menunggu verifikasi admin'
    else
      #       render action: "show"
      redirect_to @location_tourism, notice: 'cerita gagal dibuat, form komentar kosong'
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_tourism }
    end
  end

  def create
    @location_tourism = current_user.location_tourisms.new(params[:location_tourism])

    respond_to do |format|
      if @location_tourism.save
        format.html { redirect_to @location_tourism, notice: 'Tempat wisata sukses dibuat, menunggu verifikasi admin' }
        format.json { render json: @location_tourism, status: :created, location: @location_tourism }
      else
        format.html { render action: "new" }
        format.json { render json: @location_tourism.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    location_tourism = @location_tourism
    @location_tourism = current_user.location_tourism_revisions.new(params[:location_tourism])
    @location_tourism.location_tourism = location_tourism
    @location_tourism.copy_fields
  end

  def update
    location_tourism = @location_tourism
    @location_tourism = current_user.location_tourism_revisions.new(params[:location_tourism])
    @location_tourism.location_tourism = location_tourism
    
    respond_to do |format|
      if @location_tourism.save
        format.html { redirect_to @location_tourism.location_tourism, notice: 'Tempat wisata sukses diperbaharui, menunggu verifikasi admin' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_tourism.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location_tourism.destroy

    respond_to do |format|
      format.html { redirect_to location_tourisms_url }
      format.json { head :no_content }
    end
  end
end