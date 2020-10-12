# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET #home' do
    it 'must render home template' do
      get root_path
      expect(response).to render_template(:home)
    end
  end
end
