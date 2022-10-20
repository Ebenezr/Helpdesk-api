class QuestionSerializer < ActiveModel::Serializer
    attributes :id, :title, :user_id, :description, :votes, :created_at, :updated_at

    has_many :answers
    belongs_to :user
end