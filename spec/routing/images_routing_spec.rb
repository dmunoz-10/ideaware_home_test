# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesController, type: :routing do
  describe 'routing' do
    it 'routes to #search' do
      expect(get: '/images/search').to route_to('images#search')
    end

    it 'routes to #favourite' do
      expect(post: '/images/favourite').to route_to('images#favourite')
    end

    it 'routes to #favourites' do
      expect(get: '/images/favourites').to route_to('images#favourites')
    end
  end
end
