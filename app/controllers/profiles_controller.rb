class ProfilesController < ApplicationController
  load_and_authorize_resource :class => 'User'

  skip_before_filter :authenticate_user!, 
    only: [:abouts, :reviews, :folktales, :tourism_locations, :events, :tips_tricks,
    :tourism_articles,
    :new_folktale, :create_folktale,
    :new_tips_tricks, :create_tips_tricks,
    :new_event, :create_event
  ]

  layout "profile", :except => :index
  
  def index
    @profiles = @profiles.member.enabled.recent.page(params[:page]).per(20)
  end

  def abouts
  end

  def reviews
    @reviews = @profile.reviews.published.recent.page(params[:page]).per(10)
  end

  def folktales
    @folktales = @profile.folktales.published.recent.page(params[:page]).per(10)
  end

  def tourism_locations
    @tourism_locations = @profile.tourism_locations.published.recent.page(params[:page]).per(10)
  end

  def events
    @events = @profile.events.published.recent.page(params[:page]).per(10)
  end

  def tips_tricks
    @tips_tricks = @profile.tips_tricks.published.recent.page(params[:page]).per(10)
  end

  def show
    @tourism_articles   = @profile.tourism_articles.published.recent.limit(2)
    @folktales          = @profile.folktales.published.recent.limit(2)
    @tourism_locations  = @profile.tourism_locations.published.recent.limit(2)
    @events             = @profile.events.published.recent.limit(2)
    @tips_tricks        = @profile.tips_tricks.published.recent.limit(2)
    @reviews            = @profile.reviews.published.recent.limit(7)
  end

  #FOLKTALE
  def new_folktale
    @folktale = current_user.folktales.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folktale }
    end
  end

  def create_folktale
    @folktale = current_user.folktales.new(params[:folktale])

    respond_to do |format|
      if @folktale.save
        format.html { redirect_to folktales_profile_url(@profile), notice: 'Cerita rakyat telah suskses dibuat. Menunggu verifikasi admin' }
        format.json { render json: @folktale, status: :created, location: @folktale }
      else
        format.html { render action: "new_folktale" }
        format.json { render json: @folktale.errors, status: :unprocessable_entity }
      end
    end
  end

  #EVENT
  def new_event
    @event = current_user.events.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  def create_event
    @event = current_user.events.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_profile_url(@profile), notice: 'Acara wisata telah suskses dibuat. Menunggu verifikasi admin' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new_event" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  #TIPS & TRICK
  def new_tips_trick
    @tips_trick = current_user.tips_tricks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tips_trick }
    end
  end

  def create_tips_trick
    @tips_trick = current_user.tips_tricks.new(params[:tips_trick])

    respond_to do |format|
      if @tips_trick.save
        format.html { redirect_to tips_tricks_profile_url(@profile), notice: 'Tips & Trick Wisata telah suskses dibuat. Menunggu verifikasi admin' }
        format.json { render json: @tips_trick, status: :created, location: @tips_trick }
      else
        format.html { render action: "new_tips_trick" }
        format.json { render json: @tips_trick.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_about
  end

  def update_about
    respond_to do |format|
      if @profile.profile.update_attributes(params[:profile])
        format.html { redirect_to abouts_profile_url(@profile), notice: 'Profil telah sukses diperbaharui.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit_about" }
        format.json { render json: @profile.profile.errors, status: :unprocessable_entity }
      end
    end
  end

end
