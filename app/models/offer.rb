class Offer < ApplicationRecord
  enum category: [:default, :latest, :featured]

  has_attached_file :image, styles: { small: "100x100>", medium: "270x175>", large: "1024x768>" }, default_url: "/images/:style/missing.png"

  validates :location, :detail, presence: true
  validates :rate, presence: true, numericality: true
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
