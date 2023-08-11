class UserSerializer < ActiveModel::Serializer
  attributes :id,:email,:news_count 

  def news_count
    object.news.count
  end
end


