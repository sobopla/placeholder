class Artist < ApplicationRecord

  validates :name, :spotify, presence: :true
  has_many :artistgenres
  has_many :genres, through: :artistgenres

end
