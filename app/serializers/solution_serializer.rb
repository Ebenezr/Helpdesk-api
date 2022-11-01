class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :description, :votes, :created_at, :username, :last_name, :first_name
  belongs_to :user
  belongs_to :question
  has_many :notifications
  # get username of soln owner
  def username
    self.object.user.username
  end
  def last_name
    self.object.user.last_name
  end
  def first_name
    self.object.user.first_name
  end


end
