class Genre < ApplicationRecord

  validates :genre, presence: :true
  has_many :artistgenres
  has_many :artists, through: :artistgenres

end
