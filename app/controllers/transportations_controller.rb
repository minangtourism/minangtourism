class TransportationsController < ApplicationController
  # GET /transportations
  # GET /transportations.json
  def index
    @transportations = Transportation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transportations }
    end
  end

  # GET /transportations/1
  # GET /transportations/1.json
  def show
    @transportation = Transportation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transportation }
    end
  end

  # GET /transportations/new
  # GET /transportations/new.json
  def new
    @transportation = Transportation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transportation }
    end
  end

  # GET /transportations/1/edit
  def edit
    @transportation = Transportation.find(params[:id])
  end

  # POST /transportations
  # POST /transportations.json
  def create
    @transportation = Transportation.new(params[:transportation])
    @transportation.user_id = current_user.id

    respond_to do |format|
      if @transportation.save
        format.html { redirect_to @transportation, notice: 'Transportation was successfully created.' }
        format.json { render json: @transportation, status: :created, location: @transportation }
      else
        format.html { render action: "new" }
        format.json { render json: @transportation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transportations/1
  # PUT /transportations/1.json
  def update
    @transportation = Transportation.find(params[:id])

    respond_to do |format|
      if @transportation.update_attributes(params[:transportation])
        format.html { redirect_to @transportation, notice: 'Transportation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transportation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transportations/1
  # DELETE /transportations/1.json
  def destroy
    @transportation = Transportation.find(params[:id])
    @transportation.destroy

    respond_to do |format|
      format.html { redirect_to transportations_url }
      format.json { head :no_content }
    end
  end
end
