# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Images', type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #search' do
    it 'must render a json' do
      get search_images_path(q: 'panda', page: 2), xhr: true

      expect(json.keys).to eq(%w[entries])
    end
  end

  describe 'POST #favourite' do
    context 'has not liked the image' do
      it 'must add the image to favourites' do
        photos = Unsplash::Photo.search('panda', 1, 1)
        params = { image: { id_unsplash: photos[0].id, url: photos[0].urls.raw } }
        post favourite_image_path, params: params, xhr: true

        expect(json['action']).to eq('favourite')
      end
    end

    context 'has liked the image' do
      it 'must remove the image from favourites' do
        photos = Unsplash::Photo.search('panda', 1, 1)
        image = create(:image, user: user, id_unsplash: photos[0].id,
                       url: photos[0].urls.raw)

        params = { image: { id_unsplash: image.id_unsplash, url: image.url } }
        post favourite_image_path, params: params, xhr: true

        expect(json['action']).to eq('unfavourite')
      end
    end
  end

  describe 'GET #favourites' do
    context 'not an ajax request' do
      it 'must render a html' do
        get favourite_images_path

        expect(response.content_type).to eq('text/html; charset=utf-8')
        expect(response).to render_template(:favourites)
      end
    end

    context 'ajax request' do
      it 'must render a json' do
        get favourite_images_path(page: 1), xhr: true, headers: { "DATA_TYPE": "json" }

        expect(response.content_type).to eq('text/plain; charset=utf-8')
        expect(json.keys).to eq(%w[entries])
      end
    end
  end
end
