class GalleriesController < ApplicationController
  helper_method :gallery, :galleries, :image

  # GET /galleries
  # GET /galleries.json
  def index
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /galleries/1/edit
  def edit
  end

  def select
  end

  # POST /galleries/1/add-image/1
  def add
    gallery.add_image(image)
    gallery.save
    redirect_to galleries_selection_path(image)
  end

  # POST /galleries/1/remove-image/1
  def remove
    gallery.remove_image(image)
    gallery.save
    redirect_to galleries_selection_path(image)
  end

  # POST /galleries
  # POST /galleries.json
  def create
    gallery = Gallery.new(gallery_params)
    gallery.owner = current_user
    respond_to do |format|
      if gallery.save
        format.html { redirect_to gallery, notice: 'Gallery was successfully created.' }
        format.json { render :show, status: :created, location: gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    respond_to do |format|
      if gallery.update(gallery_params)
        format.html { redirect_to gallery, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: gallery }
      else
        format.html { render :edit }
        format.json { render json: gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def gallery
    @gallery ||= Gallery.find(params[:id])
  end

  def galleries
    @galleries ||= Gallery.all
  end

  def image
    @image ||= Image.find(params[:image_id])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:user_id, :name)
    end
end
