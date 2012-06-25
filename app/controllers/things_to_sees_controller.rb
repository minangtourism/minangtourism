
class ThingsToSeesController < ApplicationController
  # GET /things_to_sees
  # GET /things_to_sees.json
  def index
    @things_to_sees = ThingsToSee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @things_to_sees }
    end
  end

  # GET /things_to_sees/1
  # GET /things_to_sees/1.json
  def show
    @things_to_see = ThingsToSee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @things_to_see }
    end
  end

  # GET /things_to_sees/new
  # GET /things_to_sees/new.json
  def new
    @things_to_see = ThingsToSee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @things_to_see }
    end
  end

  # GET /things_to_sees/1/edit
  def edit
    @things_to_see = ThingsToSee.find(params[:id])
  end

  # POST /things_to_sees
  # POST /things_to_sees.json
  def create
    @things_to_see = ThingsToSee.new(params[:things_to_see])
    @things_to_see.user_id = current_user.id

    respond_to do |format|
      if @things_to_see.save
        format.html { redirect_to @things_to_see, notice: 'Things to see was successfully created.' }
        format.json { render json: @things_to_see, status: :created, location: @things_to_see }
      else
        format.html { render action: "new" }
        format.json { render json: @things_to_see.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /things_to_sees/1
  # PUT /things_to_sees/1.json
  def update
    @things_to_see = ThingsToSee.find(params[:id])

    respond_to do |format|
      if @things_to_see.update_attributes(params[:things_to_see])
        format.html { redirect_to @things_to_see, notice: 'Things to see was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @things_to_see.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things_to_sees/1
  # DELETE /things_to_sees/1.json
  def destroy
    @things_to_see = ThingsToSee.find(params[:id])
    @things_to_see.destroy

    respond_to do |format|
      format.html { redirect_to things_to_sees_url }
      format.json { head :no_content }
    end
  end
end
