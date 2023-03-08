class Mutations::CreateTag < Mutations::BaseMutation
  argument :name, String, required: true

  field :tag, Types::TagType, null: false
  field :errors, [String], null: false

  def resolve(name:)
    tag = Tag.new(name: name)

    if tag.save
      { tag: tag, errors: [] }
    else
      { tag: nil, errors: tag.errors.full_messages }
    end
  end
end
