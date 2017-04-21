class Offer < ApplicationRecord
  enum category: [:default, :latest, :featured]

  validates :location, :detail, presence: true
  validates :rate, presence: true, numericality: true
end
