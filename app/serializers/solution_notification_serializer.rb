class SolutionNotificationSerializer < ActiveModel::Serializer
  attributes :id, :question
  has_one :user
  has_one :question
  has_one :solution
  def question
     self.object.question
  end
end
