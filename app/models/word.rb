class Word < ApplicationRecord
  belongs_to :list
  has_many :translations
end
