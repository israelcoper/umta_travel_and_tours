class AddImageToOffers < ActiveRecord::Migration[5.0]
  def change
    add_attachment :offers, :image
  end
end
