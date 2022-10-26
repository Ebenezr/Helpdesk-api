class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name


  def fullname
    "#{object.first_name} #{object.last_name}"
  end
end
