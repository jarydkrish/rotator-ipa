# frozen_string_literal: true

# Schema for the Rotator IPA GraphQL API
class RotatorIpaSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Create UUIDs by joining the type name & ID, then base64-encoding it
  def self.id_from_object(object, _type, _context)
    object.to_global_id
  end

  def self.object_from_id(id, _context)
    gid = GlobalID.parse(id)
    return gid.find if gid

    raise Dogids::Graphql::Errors::ArgumentError, "#{global_id} is not a valid dogIDs id."
  end

  def self.resolve_type(_type, obj, _ctx)
    case obj
    when Beer
      Types::BeerType
    else
      raise("Unexpected object: #{obj}")
    end
  end

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections
end
