class WhereToStaysController < ApplicationController
  # GET /where_to_stays
  # GET /where_to_stays.json
  def index
    @where_to_stays = WhereToStay.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @where_to_stays }
    end
  end

  # GET /where_to_stays/1
  # GET /where_to_stays/1.json
  def show
    @where_to_stay = WhereToStay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @where_to_stay }
    end
  end

  # GET /where_to_stays/new
  # GET /where_to_stays/new.json
  def new
    @where_to_stay = WhereToStay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @where_to_stay }
    end
  end

  # GET /where_to_stays/1/edit
  def edit
    @where_to_stay = WhereToStay.find(params[:id])
  end

  # POST /where_to_stays
  # POST /where_to_stays.json
  def create
#    @where_to_stay = WhereToStay.new(params[:where_to_stay])
    @where_to_stay = WhereToStay.new(params[:where_to_stay])
    @where_to_stay.user_id = current_user.id

    respond_to do |format|
      if @where_to_stay.save
        format.html { redirect_to @where_to_stay, notice: 'Where to stay was successfully created.' }
        format.json { render json: @where_to_stay, status: :created, location: @where_to_stay }
      else
        format.html { render action: "new" }
        format.json { render json: @where_to_stay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /where_to_stays/1
  # PUT /where_to_stays/1.json
  def update
    @where_to_stay = WhereToStay.find(params[:id])

    respond_to do |format|
      if @where_to_stay.update_attributes(params[:where_to_stay])
        format.html { redirect_to @where_to_stay, notice: 'Where to stay was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @where_to_stay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /where_to_stays/1
  # DELETE /where_to_stays/1.json
  def destroy
    @where_to_stay = WhereToStay.find(params[:id])
    @where_to_stay.destroy

    respond_to do |format|
      format.html { redirect_to where_to_stays_url }
      format.json { head :no_content }
    end
  end
end
