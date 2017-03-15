class Word < ApplicationRecord
  belongs_to :list
  has_many :translations, inverse_of: :word
  accepts_nested_attributes_for :translations
end
