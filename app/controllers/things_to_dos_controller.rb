class ThingsToDosController < ApplicationController
  # GET /things_to_dos
  # GET /things_to_dos.json
  def index
    @things_to_dos = ThingsToDo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @things_to_dos }
    end
  end

  # GET /things_to_dos/1
  # GET /things_to_dos/1.json
  def show
    @things_to_do = ThingsToDo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @things_to_do }
    end
  end

  # GET /things_to_dos/new
  # GET /things_to_dos/new.json
  def new
    @things_to_do = ThingsToDo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @things_to_do }
    end
  end

  # GET /things_to_dos/1/edit
  def edit
    @things_to_do = ThingsToDo.find(params[:id])
  end

  # POST /things_to_dos
  # POST /things_to_dos.json
  def create
#    @things_to_do = ThingsToDo.new(params[:things_to_do])
    @things_to_do = ThingsToDo.new(params[:things_to_do])
    @things_to_do.user_id = current_user.id

    respond_to do |format|
      if @things_to_do.save
        format.html { redirect_to @things_to_do, notice: 'Things to do was successfully created.' }
        format.json { render json: @things_to_do, status: :created, location: @things_to_do }
      else
        format.html { render action: "new" }
        format.json { render json: @things_to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /things_to_dos/1
  # PUT /things_to_dos/1.json
  def update
    @things_to_do = ThingsToDo.find(params[:id])

    respond_to do |format|
      if @things_to_do.update_attributes(params[:things_to_do])
        format.html { redirect_to @things_to_do, notice: 'Things to do was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @things_to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things_to_dos/1
  # DELETE /things_to_dos/1.json
  def destroy
    @things_to_do = ThingsToDo.find(params[:id])
    @things_to_do.destroy

    respond_to do |format|
      format.html { redirect_to things_to_dos_url }
      format.json { head :no_content }
    end
  end
end
