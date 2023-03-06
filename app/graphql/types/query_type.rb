# frozen_string_literal: true

module Types
  # Query Root
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :beers,
          Types::BeerType.connection_type,
          null: false,
          description: 'Beers being brewed'

    def beers
      Beer.all
    end
  end
end
