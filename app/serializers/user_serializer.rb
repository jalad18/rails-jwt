class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :properties_count, :role

  def properties_count
    object.properties.count
  end
end
