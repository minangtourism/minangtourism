class EventsController < ApplicationController
  load_and_authorize_resource
  impressionist

  def index
    @events = @events.published.recent.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def like
    @like = current_user.likes.new(params[:like])
    @like.likeable = @event

    if @like.save
      redirect_to @event
    else
      render action: "show"
    end
  end

  def show
    @comments = @event.comments.published.recent.page(params[:page]).per(10)
    @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  def create_comment
    @comment = current_user.comments.new(params[:comment])
    @comment.commentable = @event
    
    if @comment.save
      redirect_to @event, notice: 'Komentar sukses dibuat, menunggu verifikasi admin'
    else
      #       render action: "show"
      redirect_to @event, notice: 'Komentar gagal dibuat, form komentar kosong'
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Acara wisata sukses dibuat' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Acara wisata sukses diperbaharui' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
