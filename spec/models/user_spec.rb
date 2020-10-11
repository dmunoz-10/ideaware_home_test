# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Username validation' do
    it 'must exist' do
      user = build(:user, username: nil)
      user.save
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'must be unique' do
      create(:user, username: 'hola_mundo')
      user = build(:user, username: 'hola_mundo')
      user.save
      expect(user.errors[:username]).to include('has already been taken')
    end

    it 'must be valid' do
      user = build(:user, username: 'invalid/username')
      user.save
      expect(user.errors[:username]).to include('is invalid')
    end

    it 'must have 30 characters maximum' do
      user = build(:user, username: 'a' * 31)
      user.save
      expect(user.errors[:username]).to include('is invalid')
    end
  end

  describe 'Email validation' do
    it 'must exist' do
      user = build(:user, email: nil)
      user.save
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'must be unique' do
      create(:user, email: 'hola@mundo.com')
      user = build(:user, email: 'hola@mundo.com')
      user.save
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'must be valid' do
      user = build(:user, email: 'invalid_email')
      user.save
      expect(user.errors[:email]).to include('is invalid')
    end
  end

  describe 'Password validation' do
    it 'must have 6 characters minimum' do
      user = build(:user, password: '123', password_confirmation: '123')
      user.save
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  end
end
