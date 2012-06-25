class GettingTheresController < ApplicationController
  # GET /getting_theres
  # GET /getting_theres.json
  def index
    @getting_theres = GettingThere.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @getting_theres }
    end
  end

  # GET /getting_theres/1
  # GET /getting_theres/1.json
  def show
    @getting_there = GettingThere.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @getting_there }
    end
  end

  # GET /getting_theres/new
  # GET /getting_theres/new.json
  def new
    @getting_there = GettingThere.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @getting_there }
    end
  end

  # GET /getting_theres/1/edit
  def edit
    @getting_there = GettingThere.find(params[:id])
  end

  # POST /getting_theres
  # POST /getting_theres.json
  def create
#    @getting_there = GettingThere.new(params[:getting_there])
    @getting_there = GettingThere.new(params[:getting_there])
    @getting_there.user_id =  current_user.id

    respond_to do |format|
      if @getting_there.save
        format.html { redirect_to @getting_there, notice: 'Getting there was successfully created.' }
        format.json { render json: @getting_there, status: :created, location: @getting_there }
      else
        format.html { render action: "new" }
        format.json { render json: @getting_there.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /getting_theres/1
  # PUT /getting_theres/1.json
  def update
    @getting_there = GettingThere.find(params[:id])

    respond_to do |format|
      if @getting_there.update_attributes(params[:getting_there])
        format.html { redirect_to @getting_there, notice: 'Getting there was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @getting_there.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /getting_theres/1
  # DELETE /getting_theres/1.json
  def destroy
    @getting_there = GettingThere.find(params[:id])
    @getting_there.destroy

    respond_to do |format|
      format.html { redirect_to getting_theres_url }
      format.json { head :no_content }
    end
  end
end
