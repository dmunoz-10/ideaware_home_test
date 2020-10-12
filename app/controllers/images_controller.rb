# frozen_string_literal: true

# Images Controller
class ImagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :search

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
    @image = Image.find_by(id_unsplash: params[:image][:id_unsplash])
    if @image
      @image.destroy
    else
      @image = current_user.images.create(image_params)
    end
  end

  private

  def image_params
    params.require(:image).permit(:id_unsplash, :url)
  end
end
