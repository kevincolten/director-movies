module Types
  class MutationType < Types::BaseObject
    field :create_tag, mutation: Mutations::CreateTag
    field :delete_tag, mutation: Mutations::DeleteTag
    field :attach_tag_to_movie, mutation: Mutations::AttachTagToMovie
    field :detach_tag_from_movie, mutation: Mutations::DetachTagFromMovie
  end
end
