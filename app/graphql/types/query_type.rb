# frozen_string_literal: true

module Types
  # Query Root
  class QueryType < Types::BaseObject
    add_field(GraphQL::Types::Relay::NodeField)
    add_field(GraphQL::Types::Relay::NodesField)

    field :beers,
          Types::BeerType.connection_type,
          null: false,
          description: 'Beers being brewed'

    def beers
      Beer.all
    end
  end
end
