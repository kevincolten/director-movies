# frozen_string_literal: true

module Types
  class MovieType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :rating, Integer
    field :director_id, Integer, null: false
    field :tags, [TagType]
    field :director, DirectorType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
