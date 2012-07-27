class FolktalesController < ApplicationController
  load_and_authorize_resource
  impressionist
  
  def index
    @folktales = @folktales.published.recent.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @folktales }
    end
  end

  def show
    @comments = @folktale.comments.published.recent.page(params[:page]).per(10)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @folktale }
    end
  end

  def create_comment
    @comment = current_user.comments.new(params[:comment])
    @comment.commentable = @folktale

    if @comment.save
      redirect_to @folktale, notice: 'Komentar sukses dibuat, menunggu verifikasi admin'
    else
      #       render action: "show"
      redirect_to @folktale, notice: 'Komentar gagal dibuat, form komentar kosong'
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folktale }
    end
  end

  def edit
  end

  def create
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

  def update
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

  def destroy
    @folktale.destroy

    respond_to do |format|
      format.html { redirect_to folktales_url }
      format.json { head :no_content }
    end
  end
end
