# frozen_string_literal: true

module Types
  class MovieTagType < Types::BaseObject
    field :id, ID, null: false
    field :movie_id, ID, null: false
    field :tag_id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
