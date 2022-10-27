class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :description, :votes, :created_at, :tag_list
  belongs_to :user
  has_many :solutions
end
