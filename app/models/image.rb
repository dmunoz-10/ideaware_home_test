# frozen_string_literal: true

# Image Model
class Image < ApplicationRecord
  belongs_to :user

  validates :id_unsplash, presence: true
end
