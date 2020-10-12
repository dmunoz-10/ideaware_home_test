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
  end
end
