# frozen_string_literal: true

# Images Controller
class ImagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :search
  before_action :set_image, only: :destroy

  def search
    @page = params[:page] || 1
    @images = Unsplash::Photo.search(params[:q], @page, 12)
    render json: {
      entries: render_to_string(
        partial: 'images/image',
        collection: @images,
        as: :image,
        formats: [:html]
      )
    }
  end

  def favourite
    @image = current_user.images.new(image_params)
    if @image.save
      render :favourite
    else
      render :error
    end
  end

  def unfavourite
    if @image.destroy
      render :destroy
    else
      render :error
    end
  end

  private

  def image_params
    params.require(:image).permit(:id_unsplash)
  end

  def set_image
    @image = Image.find_by_hashid!(params[:id])
  end
end
