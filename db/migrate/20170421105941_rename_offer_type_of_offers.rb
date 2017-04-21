class RenameOfferTypeOfOffers < ActiveRecord::Migration[5.0]
  def change
    rename_column :offers, :offer_type, :category
  end
end
