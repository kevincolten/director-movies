class Mutations::AttachTagToMovie < Mutations::BaseMutation
  argument :tag_id, ID, required: true
  argument :movie_id, ID, required: true

  field :tag, Types::TagType, null: false
  field :movie, Types::MovieType, null: false
  field :errors, [String], null: false

  def resolve(tag_id:, movie_id:)
    movie = Movie.find(movie_id)
    tag = Tag.find(tag_id)
    movie.movie_tags.create!(tag_id:)

    if movie and tag
      { tag: tag, movie: movie, errors: [] }
    else
      { tag: nil, errors: tag.errors.full_messages }
    end
  end
end
