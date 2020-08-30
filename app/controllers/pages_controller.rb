# frozen_string_literal: true

# Static pages for the app
class PagesController < ApplicationController
  def home
    @beers = Beer.order(start_date: :desc).first(3)
  end
end
