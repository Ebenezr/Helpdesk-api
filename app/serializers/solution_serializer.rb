class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :description, :votes, :created_at
  belongs_to :user
end
