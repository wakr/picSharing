require 'json'

class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # POST /pictures
  # POST /pictures.json
  def create

    if !params['picture'].present?
      redirect_to :back
      return
    end

    @picture = Picture.new(picture_params)

    file_params = params['picture']
    file_name = file_params['image'].original_filename
    file_name = ::EncodeUtils.form_name(file_name)

    @picture.url = file_name

    respond_to do |format|
      if @picture.save
        format.html { redirect_to "/pictures/#{@picture.url}", notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find_by(:url => params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:image, :uploaded, :url, :score)
    end
end
