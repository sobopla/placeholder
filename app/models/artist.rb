class Artist < ApplicationRecord

  validates :name, :spotify, presence: :true
  has_many :artistgenres
  has_many :genres, through: :artistgenres

  def has_genre?(genre)
    self.genres.pluck(:genre).any? { |word| word.include?(genre) }
  end

  def has_weird_characters
    !!(self.name).match(/[^\w\s]/)
  end


end
