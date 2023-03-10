module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :directors, [Types::DirectorType], null: false
    def directors
      Director.all
    end

    field :director, Types::DirectorType, null: false do
      argument :id, ID, required: true
    end
    def director(id:)
      Director.find(id)
    end

    field :movies, [Types::MovieType], null: false do
      argument :options, GraphQL::Types::JSON, required: false
    end
    def movies(options: nil)
      movies = Movie.all
      if options && options['order']
        movies = movies.order(options['order'])
      end
      if options && options['like']
        movies = movies.where("title LIKE ?", "%#{options['like']}%")
      end
      if options && options['rating']
        movies = movies.where("rating = ?", options['rating'])
      end
      movies
    end

    field :movie, Types::MovieType, null: false do
      argument :id, ID, required: true
    end
    def movie(id:)
      Movie.find(id)
    end

    field :tags, [Types::TagType], null: false
    def tags
      Tag.all
    end

    field :tag, Types::TagType, null: false do
      argument :id, ID, required: true
    end
    def tag(id:)
      Tag.find(id)
    end
  end
end
