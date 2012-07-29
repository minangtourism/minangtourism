class ProfileTipsTricksController < ApplicationController
  load_and_authorize_resource :profile, :class => "User"
  load_and_authorize_resource :tips_trick, through: :profile, :class => "TipsTrick", parent: false
  before_filter :prepare_tips_trick_revision, only: [:edit, :update]

  layout "profile"

  def index
    @tips_tricks = @tips_tricks.recent.published.page(params[:page]).per(10)
    @new_tips_trick = @profile.tips_tricks.new
  end

  def new
  end

  def create
    respond_to do |format|
      if @tips_trick.save
        format.html { redirect_to profile_tips_tricks_url(@profile), notice: 'Cerita Rakyat berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @tips_trick, status: :created, location: @tips_trick }
      else
        format.html { render action: "new" }
        format.json { render json: @tips_trick.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @tips_trick_revision.save
        format.html { redirect_to profile_tips_tricks_url(@profile), notice: 'Cerita Rakyat berhasil diperbaharui. Menunggu verifikasi admin' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tips_trick_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    deletion_request = current_user.deletion_requests.create(item: @tips_trick)

    respond_to do |format|
      if deletion_request.errors.blank?
        format.html { redirect_to profile_tips_tricks_url(@profile), notice: 'Permohonan penghapusan Cerita Rakyat berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @tips_trick, status: :created, location: @tips_trick }
      else
        format.html { redirect_to request.referer || profile_tips_tricks_url(@profile), alert: 'Permohonan penghapusan sebelumnya pada Cerita Rakyat yang sama masih menunggu verifikasi admin' }
        format.json { render json: @tips_trick.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def prepare_tips_trick_revision
    @tips_trick_revision = current_user.tips_trick_revisions.new
    @tips_trick_revision.tips_trick = @tips_trick
    @tips_trick_revision.copy_fields
    @tips_trick_revision.attributes = params[:tips_trick]
  end
end
