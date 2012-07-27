class WhySumbarsController < ApplicationController

  def index
    @why_sumbars      = WhySumbar.recent.all
    @getting_theres   = GettingThere.recent.all
    @where_to_stays   = WhereToStay.recent.all
    @things_to_dos    = ThingsToDo.recent.all
    @things_to_sees   = ThingsToSee.recent.all
    @foods            = Food.recent.all
    @transportations  = Transportation.recent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @why_sumbars }
    end
  end

  def show
    @why_sumbar = WhySumbar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @why_sumbar }
    end
  end

  def new
    @why_sumbar = WhySumbar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @why_sumbar }
    end
  end

  def edit
    @why_sumbar = WhySumbar.find(params[:id])
  end

  def create
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

  def destroy
    @why_sumbar = WhySumbar.find(params[:id])
    @why_sumbar.destroy

    respond_to do |format|
      format.html { redirect_to why_sumbars_url }
      format.json { head :no_content }
    end
  end
end
