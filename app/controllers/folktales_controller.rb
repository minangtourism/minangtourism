class FolktalesController < ApplicationController
  load_and_authorize_resource
  # GET /folktales
  # GET /folktales.json
  def index
    #    @folktales = Folktale.all
    @folktales = Folktale.order("created_at desc").page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @folktales }
    end
  end

  # GET /folktales/1
  # GET /folktales/1.json
  def show
#    @folktale = Folktale.find(params[:id])
#    @folktale.increment! :read_count
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @folktale }
    end
  end

  def create_comment
#    @folktale = Folktale.find(params[:id])
    @comment = current_user.comments.new(params[:comment])
    @comment.commentable = @folktale

    if @comment.save
      redirect_to @folktale
    else
      render action: "show"
    end
  end

  # GET /folktales/new
  # GET /folktales/new.json
  def new
#    @folktale = Folktale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folktale }
    end
  end

  # GET /folktales/1/edit
  def edit
#    @folktale = Folktale.find(params[:id])
  end

  # POST /folktales
  # POST /folktales.json
  def create
#    @folktale = current_user.folktales.new(params[:folktale])

    respond_to do |format|
      if @folktale.save
        format.html { redirect_to @folktale, notice: 'Folktale was successfully created.' }
        format.json { render json: @folktale, status: :created, location: @folktale }
      else
        format.html { render action: "new" }
        format.json { render json: @folktale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /folktales/1
  # PUT /folktales/1.json
  def update
#    @folktale = Folktale.find(params[:id])

    respond_to do |format|
      if @folktale.update_attributes(params[:folktale])
        format.html { redirect_to @folktale, notice: 'Folktale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @folktale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folktales/1
  # DELETE /folktales/1.json
  def destroy
#    @folktale = Folktale.find(params[:id])
    @folktale.destroy

    respond_to do |format|
      format.html { redirect_to folktales_url }
      format.json { head :no_content }
    end
  end
end
