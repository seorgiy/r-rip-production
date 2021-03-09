class Api::V1::SerializableInvite < JSONAPI::Serializable::Resource
  type 'invite'

  attributes :email, :name, :tg
end
