# frozen_string_literal: true

# Pages Controller
class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home; end
end
