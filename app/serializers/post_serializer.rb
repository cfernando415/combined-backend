class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :mod_id, :user_id
end
