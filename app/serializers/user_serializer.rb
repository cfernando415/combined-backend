class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :password, :mod_id
end
