class PropertySerializer < ActiveModel::Serializer
  # attributes :id, :name, :price, :city, :year, :status :user_id
  attributes :id, :name, :city, :country, :price, :year, :status, :user_id
end
