class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :description, :votes, :created_at
  belongs_to :user
  belongs_to :question
  has_many :notifications
end
