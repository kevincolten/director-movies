class Mutations::DeleteTag < Mutations::BaseMutation
  argument :id, ID, required: true

  field :tag, Types::TagType, null: false
  field :errors, [String], null: false

  def resolve(id:)
    tag = Tag.destroy(id)

    if tag
      { tag: tag, errors: [] }
    else
      { tag: nil, errors: tag.errors.full_messages }
    end
  end
end
