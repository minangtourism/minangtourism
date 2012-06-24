
class TipsTricksController < ApplicationController
  # GET /tips_tricks
  # GET /tips_tricks.json
  def index
    #    @tips_tricks = TipsTrick.all
    @tips_tricks = TipsTrick.order("created_at desc").page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tips_tricks }
    end
  end

  # GET /tips_tricks/1
  # GET /tips_tricks/1.json
  def show
    @tips_trick = TipsTrick.find(params[:id])
    @tips_trick.increment! :read_count
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tips_trick }
    end
  end

  def create_comment
    @tips_trick = TipsTrick.find(params[:id])
    @comment = current_user.comments.new(params[:comment])
    @comment.commentable = @tips_trick

    if @comment.save
      redirect_to @tips_trick
    else
      render action: "show"
    end
  end

  # GET /tips_tricks/new
  # GET /tips_tricks/new.json
  def new
    @tips_trick = TipsTrick.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tips_trick }
    end
  end

  # GET /tips_tricks/1/edit
  def edit
    @tips_trick = TipsTrick.find(params[:id])
  end

  # POST /tips_tricks
  # POST /tips_tricks.json
  def create
    @tips_trick = current_user.tips_tricks.new(params[:tips_trick])

    respond_to do |format|
      if @tips_trick.save
        format.html { redirect_to @tips_trick, notice: 'Tips trick was successfully created.' }
        format.json { render json: @tips_trick, status: :created, location: @tips_trick }
      else
        format.html { render action: "new" }
        format.json { render json: @tips_trick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tips_tricks/1
  # PUT /tips_tricks/1.json
  def update
    @tips_trick = TipsTrick.find(params[:id])

    respond_to do |format|
      if @tips_trick.update_attributes(params[:tips_trick])
        format.html { redirect_to @tips_trick, notice: 'Tips trick was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tips_trick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips_tricks/1
  # DELETE /tips_tricks/1.json
  def destroy
    @tips_trick = TipsTrick.find(params[:id])
    @tips_trick.destroy

    respond_to do |format|
      format.html { redirect_to tips_tricks_url }
      format.json { head :no_content }
    end
  end
end
