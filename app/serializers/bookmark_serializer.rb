class BookmarkSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :question
end
