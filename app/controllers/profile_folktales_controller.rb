class ProfileFolktalesController < ApplicationController
  load_and_authorize_resource :profile, :class => "User"
  load_and_authorize_resource :folktale, through: :profile, :class => "Folktale", parent: false
  before_filter :prepare_folktale_revision, only: [:edit, :update]

  layout "profile"

  def index
    @folktales = @folktales.recent.published.page(params[:page]).per(10)
    @new_folktale = @profile.folktales.new
  end

  def new
  end

  def create
    respond_to do |format|
      if @folktale.save
        format.html { redirect_to profile_folktales_url(@profile), notice: 'Cerita Rakyat berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @folktale, status: :created, location: @folktale }
      else
        format.html { render action: "new" }
        format.json { render json: @folktale.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @folktale_revision.save
        format.html { redirect_to profile_folktales_url(@profile), notice: 'Cerita Rakyat berhasil diperbaharui. Menunggu verifikasi admin' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @folktale_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    deletion_request = current_user.deletion_requests.create(item: @folktale)

    respond_to do |format|
      if deletion_request.errors.blank?
        format.html { redirect_to profile_folktales_url(@profile), notice: 'Permohonan penghapusan Cerita Rakyat berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @folktale, status: :created, location: @folktale }
      else
        format.html { redirect_to request.referer || profile_folktales_url(@profile), alert: 'Permohonan penghapusan sebelumnya pada Cerita Rakyat yang sama masih menunggu verifikasi admin' }
        format.json { render json: @folktale.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def prepare_folktale_revision
    @folktale_revision = current_user.folktale_revisions.new
    @folktale_revision.folktale = @folktale
    @folktale_revision.copy_fields
    @folktale_revision.attributes = params[:folktale]
  end
end
