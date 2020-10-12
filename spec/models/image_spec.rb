# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'Url Validation' do
    it 'must exist' do
      user = create(:user)
      image = build(:image, user: user, url: nil)
      image.save
      expect(image.errors[:url]).to include("can't be blank")
    end

    it 'must be unique' do
      user = create(:user)
      image = create(:image, user: user)
      image2 = build(:image, user: user, url: image.url)
      image2.save
      expect(image2.errors[:url]).to include('has already been taken')
    end
  end

  describe 'Id unsplash Validation' do
    it 'must exist' do
      user = create(:user)
      image = build(:image, user: user, id_unsplash: nil)
      image.save
      expect(image.errors[:id_unsplash]).to include("can't be blank")
    end

    it 'must be unique' do
      user = create(:user)
      image = create(:image, user: user)
      image2 = build(:image, user: user, id_unsplash: image.id_unsplash)
      image2.save
      expect(image2.errors[:id_unsplash]).to include('has already been taken')
    end
  end
end
