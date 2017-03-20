class Strona < ApplicationRecord
  belongs_to :kategorie
  has_many :artykuls
end
