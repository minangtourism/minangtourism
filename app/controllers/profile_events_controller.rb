class ProfileEventsController < ApplicationController
  load_and_authorize_resource :profile, :class => "User"
  load_and_authorize_resource :event, through: :profile, :class => "Event", parent: false
  before_filter :prepare_event_revision, only: [:edit, :update]

  layout "profile"

  def index
    @events = @events.recent.published.page(params[:page]).per(10)
    @new_event = @profile.events.new
  end

  def new
  end

  def create
    respond_to do |format|
      if @event.save
        format.html { redirect_to profile_events_url(@profile), notice: 'Acara Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event_revision.save
        format.html { redirect_to profile_events_url(@profile), notice: 'Acara Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    deletion_request = current_user.deletion_requests.create(item: @event)

    respond_to do |format|
      if deletion_request.errors.blank?
        format.html { redirect_to profile_events_url(@profile), notice: 'Permohonan penghapusan Acara Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { redirect_to request.referer || profile_events_url(@profile), alert: 'Permohonan penghapusan sebelumnya pada Acara Wisata yang sama masih menunggu verifikasi admin' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def prepare_event_revision
    @event_revision = current_user.event_revisions.new
    @event_revision.event = @event
    @event_revision.copy_fields
    @event_revision.attributes = params[:event]
  end
end
