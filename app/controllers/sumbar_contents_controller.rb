class SumbarContentsController < ApplicationController
  # GET /sumbar_contents
  # GET /sumbar_contents.json
  def index
    @sumbar_contents = SumbarContent.recent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sumbar_contents }
    end
  end

  # GET /sumbar_contents/1
  # GET /sumbar_contents/1.json
  def show
    @sumbar_content = SumbarContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sumbar_content }
    end
  end

  # GET /sumbar_contents/new
  # GET /sumbar_contents/new.json
  def new
    @sumbar_content = SumbarContent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sumbar_content }
    end
  end

  # GET /sumbar_contents/1/edit
  def edit
    @sumbar_content = SumbarContent.find(params[:id])
  end

  # POST /sumbar_contents
  # POST /sumbar_contents.json
  def create
    @sumbar_content = SumbarContent.new(params[:sumbar_content])

    respond_to do |format|
      if @sumbar_content.save
        format.html { redirect_to @sumbar_content, notice: 'Sumbar content was successfully created.' }
        format.json { render json: @sumbar_content, status: :created, location: @sumbar_content }
      else
        format.html { render action: "new" }
        format.json { render json: @sumbar_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sumbar_contents/1
  # PUT /sumbar_contents/1.json
  def update
    @sumbar_content = SumbarContent.find(params[:id])

    respond_to do |format|
      if @sumbar_content.update_attributes(params[:sumbar_content])
        format.html { redirect_to @sumbar_content, notice: 'Sumbar content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sumbar_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sumbar_contents/1
  # DELETE /sumbar_contents/1.json
  def destroy
    @sumbar_content = SumbarContent.find(params[:id])
    @sumbar_content.destroy

    respond_to do |format|
      format.html { redirect_to sumbar_contents_url }
      format.json { head :no_content }
    end
  end
end
