# frozen_string_literal: true

module Types
  # Base interface
  module BaseInterface
    include GraphQL::Schema::Interface

    field_class Types::BaseField
  end
end
