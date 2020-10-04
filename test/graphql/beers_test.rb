# frozen_string_literal: true

require 'test_helper'

class BeersTest < ActiveSupport::TestCase
  test 'rendering beers when hitting the GraphQL API' do
    beer = Beer.create(name: 'Super Duper Beer')

    query_string = <<-GRAPHQL
      query($id: ID!) {
        node(id: $id) {
          ... on Beer {
            id
            name
          }
        }
      }
    GRAPHQL

    beer_id = RotatorIpaSchema.id_from_object(beer, Types::BeerType, {}).to_s
    result = RotatorIpaSchema.execute(query_string, variables: { id: beer_id })
    beer_result = result.to_h['data']['node']
    assert_equal beer_id, beer_result['id']
    assert_equal beer.name, beer_result['name']
    beer.destroy!
  end
end
