# frozen_string_literal: true

module Types
  # Base object
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField
  end
end
