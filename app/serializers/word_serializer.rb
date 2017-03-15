class WordSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :translations
end
