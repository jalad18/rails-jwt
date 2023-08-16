class UserSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  attributes :id,:email,:news_count 

  def news_count
    object.news.count
  end
end


=======
  attributes :id, :name, :properties_count, :role

  def properties_count
    object.properties.count
  end
end
>>>>>>> origin/main
