class Offer < ApplicationRecord
  enum offer_type: [:default, :latest, :featured]

  validates :location, :detail, presence: true
  validates :rate, presence: true, numericality: true
end
