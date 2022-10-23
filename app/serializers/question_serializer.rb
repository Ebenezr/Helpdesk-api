class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :description, :votes

  belongs_to :user
  has_many :solutions
end
