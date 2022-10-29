class BookmarkSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :question_id
  has_one :user
  has_one :question
end
