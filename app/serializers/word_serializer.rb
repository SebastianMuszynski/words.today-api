class WordSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at
  has_many :translations
end
