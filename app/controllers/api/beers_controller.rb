module Api
  class BeersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      p params.to_unsafe_h
      render json: { created: true }
    end
  end
end
