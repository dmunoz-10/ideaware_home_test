# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET new_user_registration' do
    it 'must render new registration template' do
      get new_user_registration_path

      expect(response).to render_template('devise/registrations/new')
    end
  end

  describe 'POST user_registration' do
    it 'must create a user and render root path' do
      params = { user: attributes_for(:user) }
      post user_registration_path, params: params

      expect(User.first.username).to eq(params[:user][:username])
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET edit_user_registration' do
    it 'must render edit registration template' do
      user = create(:user)
      sign_in user
      get edit_user_registration_path

      expect(response).to render_template('devise/registrations/edit')
    end
  end

  describe 'PUT user_registration' do
    it 'must update the user edit registration template' do
      user = create(:user)
      sign_in user
      params = { user: attributes_for(:user, current_password: '123456') }
      put user_registration_path, params: params

      expect(User.first.username).to eq(params[:user][:username])
      expect(response).to redirect_to(root_path)
    end
  end
end
