class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /journals
  # POST /journals.json
  def create
    require 'fileutils'
    require 'exifr'
    tmp = params[:file_upload][:file].tempfile
    ofile = params[:file_upload][:file].original_filename
    #file = File.join("public", "data", params[:file_upload][:file].original_filename)
    tmpname = File.basename(Tempfile.new("img").to_path)
    file = File.join("public", "data", "#{tmpname}#{File.extname(ofile)}")

    FileUtils.cp tmp.path, file
    @image = Image.new
    @image.lat = EXIFR::JPEG.new(file).gps_lat.to_s
    @image.lng = EXIFR::JPEG.new(file).gps_lng.to_s
    @image.name = ofile
    @image.filename = File.basename(file)


    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :ok }
    end
  end
end
