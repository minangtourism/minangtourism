class TipsTricksController < ApplicationController
  load_and_authorize_resource
  impressionist
  
  def index
    @tips_tricks = @tips_tricks.published.recent.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tips_tricks }
    end
  end

  def show
    @comments = @tips_trick.comments.published.recent.page(params[:page]).per(10)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tips_trick }
    end
  end

  def create_comment
    @comment = current_user.comments.new(params[:comment])
    @comment.commentable = @tips_trick

    if @comment.save
      redirect_to @tips_trick, notice: 'Komentar sukses dibuat, menunggu verifikasi admin'
    else
      #       render action: "show"
      redirect_to @tips_trick, notice: 'Komentar gagal dibuat, form komentar kosong'
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tips_trick }
    end
  end

  def edit
  end

  def create
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

  def update
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

  def destroy
    @tips_trick.destroy

    respond_to do |format|
      format.html { redirect_to tips_tricks_url }
      format.json { head :no_content }
    end
  end
end
