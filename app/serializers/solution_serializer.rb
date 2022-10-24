class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :description, :votes
  belongs_to :user
end
