class ProfileLocationTourismsController < ApplicationController
  load_and_authorize_resource :profile, :class => "User"
  load_and_authorize_resource :location_tourism, through: :profile, :class => "LocationTourism", parent: false
  before_filter :prepare_location_tourism_revision, only: [:edit, :update]

  layout "profile"

  def index
    @location_tourisms = @location_tourisms.recent.published.page(params[:page]).per(10)
    @new_location_tourism = @profile.location_tourisms.new
  end

  def new
  end

  def create
    respond_to do |format|
      if @location_tourism.save
        format.html { redirect_to profile_location_tourisms_url(@profile), notice: 'Tempat Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @location_tourism, status: :created, location: @location_tourism }
      else
        format.html { render action: "new" }
        format.json { render json: @location_tourism.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @location_tourism_revision.save
        format.html { redirect_to profile_location_tourisms_url(@profile), notice: 'Tempat Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_tourism_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    deletion_request = current_user.deletion_requests.create(item: @location_tourism)

    respond_to do |format|
      if deletion_request.errors.blank?
        format.html { redirect_to profile_location_tourisms_url(@profile), notice: 'Permohonan penghapusan Tempat Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @location_tourism, status: :created, location: @location_tourism }
      else
        format.html { redirect_to request.referer || profile_location_tourisms_url(@profile), alert: 'Permohonan penghapusan sebelumnya pada Tempat Wisata yang sama masih menunggu verifikasi admin' }
        format.json { render json: @location_tourism.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def prepare_location_tourism_revision
    @location_tourism_revision = current_user.location_tourism_revisions.new
    @location_tourism_revision.location_tourism = @location_tourism
    @location_tourism_revision.copy_fields
    @location_tourism_revision.attributes = params[:location_tourism]
  end
end
