# frozen_string_literal: true

module Types
  # Beer
  class BeerType < Types::BaseObject
    implements GraphQL::Types::Relay::Node

    global_id_field :id

    field :description, String, null: true
    field :kind, String, null: true
    field :name, String, null: true
    field :recipe_url, String, null: false

    # Record Dates
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Beer dates
    field :bottle_date, GraphQL::Types::ISO8601Date, null: true
    field :ready_date, GraphQL::Types::ISO8601Date, null: true
    field :start_date, GraphQL::Types::ISO8601Date, null: true

    def recipe_url
      Rails.application.routes.url_helpers.show_description_beer_url(object)
    end
  end
end
