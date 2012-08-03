class ProfileTourismLocationsController < ApplicationController
  load_and_authorize_resource :profile, :class => "User"
  load_and_authorize_resource :tourism_location, through: :profile, :class => "TourismLocation", parent: false
  before_filter :prepare_tourism_location_revision, only: [:edit, :update]

  layout "profile"

  def index
    @tourism_locations = @tourism_locations.recent.published.page(params[:page]).per(10)
    @new_tourism_location = @profile.tourism_locations.new
  end

  def new
  end

  def create
    respond_to do |format|
      if @tourism_location.save
        format.html { redirect_to profile_tourism_locations_url(@profile), notice: 'Tempat Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @tourism_location, status: :created, location: @tourism_location }
      else
        format.html { render action: "new" }
        format.json { render json: @tourism_location.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @tourism_location_revision.save
        format.html { redirect_to profile_tourism_locations_url(@profile), notice: 'Tempat Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tourism_location_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    deletion_request = current_user.deletion_requests.create(item: @tourism_location)

    respond_to do |format|
      if deletion_request.errors.blank?
        format.html { redirect_to profile_tourism_locations_url(@profile), notice: 'Permohonan penghapusan Tempat Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @tourism_location, status: :created, location: @tourism_location }
      else
        format.html { redirect_to request.referer || profile_tourism_locations_url(@profile), alert: 'Permohonan penghapusan sebelumnya pada Tempat Wisata yang sama masih menunggu verifikasi admin' }
        format.json { render json: @tourism_location.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def prepare_tourism_location_revision
    @tourism_location_revision = current_user.tourism_location_revisions.new
    @tourism_location_revision.tourism_location = @tourism_location
    @tourism_location_revision.copy_fields
    @tourism_location_revision.attributes = params[:tourism_location]
  end
end
