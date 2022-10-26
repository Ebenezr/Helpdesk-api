class QuestionsTagSerializer < ActiveModel::Serializer
  attributes :id
  has_one :question
  has_one :tag
end
