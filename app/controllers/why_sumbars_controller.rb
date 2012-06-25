class WhySumbarsController < ApplicationController
  # GET /why_sumbars
  # GET /why_sumbars.json
  def index

    @why_sumbars      = WhySumbar.all
    @getting_theres   = GettingThere.all
    @where_to_stays   = WhereToStay.all
    @things_to_dos    = ThingsToDo.all
    @things_to_sees   = ThingsToSee.all
    @foods            = Food.all
    @transportations  = Transportation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @why_sumbars }
    end
  end

  # GET /why_sumbars/1
  # GET /why_sumbars/1.json
  def show
    @why_sumbar = WhySumbar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @why_sumbar }
    end
  end

  # GET /why_sumbars/new
  # GET /why_sumbars/new.json
  def new
    @why_sumbar = WhySumbar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @why_sumbar }
    end
  end

  # GET /why_sumbars/1/edit
  def edit
    @why_sumbar = WhySumbar.find(params[:id])
  end

  # POST /why_sumbars
  # POST /why_sumbars.json
  def create
#    @why_sumbar = current_user.why_sumbars.new(params[:why_sumbar])
    @why_sumbar = WhySumbar.new(params[:why_sumbar])
    @why_sumbar.user_id =  current_user.id

    respond_to do |format|
      if @why_sumbar.save
        format.html { redirect_to @why_sumbar, notice: 'Why sumbar was successfully created.' }
        format.json { render json: @why_sumbar, status: :created, location: @why_sumbar }
      else
        format.html { render action: "new" }
        format.json { render json: @why_sumbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /why_sumbars/1
  # PUT /why_sumbars/1.json
  def update
    @why_sumbar = WhySumbar.find(params[:id])

    respond_to do |format|
      if @why_sumbar.update_attributes(params[:why_sumbar])
        format.html { redirect_to @why_sumbar, notice: 'Why sumbar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @why_sumbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /why_sumbars/1
  # DELETE /why_sumbars/1.json
  def destroy
    @why_sumbar = WhySumbar.find(params[:id])
    @why_sumbar.destroy

    respond_to do |format|
      format.html { redirect_to why_sumbars_url }
      format.json { head :no_content }
    end
  end
end
