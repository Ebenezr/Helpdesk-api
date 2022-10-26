class QuestionsTagSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :question
  has_one :tag
  belongs_to :user

  def name
    object.tag.name
  end
 
end
