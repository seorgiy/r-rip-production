class Api::V1::SerializableUser < JSONAPI::Serializable::Resource
  type 'user'

  attributes :email
end
