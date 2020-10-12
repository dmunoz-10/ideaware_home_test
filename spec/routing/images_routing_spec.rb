# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesController, type: :routing do
  describe 'routing' do
    it 'routes to #search' do
      expect(get: '/images/search').to route_to('images#search')
    end

    it 'routes to #favorite' do
      expect(post: '/images/favorite').to route_to('images#favorite')
    end

    it 'routes to #favorites' do
      expect(get: '/images/favorites').to route_to('images#favorites')
    end
  end
end
