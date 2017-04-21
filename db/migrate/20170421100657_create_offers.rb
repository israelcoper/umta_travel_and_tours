class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :offer_type, default: 0, null: false
      t.string :location
      t.text :detail
      t.decimal :rate, default: 0.0, precision: 16, scale: 2

      t.timestamps
    end
  end
end
