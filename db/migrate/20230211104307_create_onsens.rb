class CreateOnsens < ActiveRecord::Migration[6.1]
  def change
    create_table :onsens do |t|
      t.references :favorite, null: false, foreign_key: true
      t.references :visit, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.references :onsen_senshitu, null: false, foreign_key: true
      t.references :onsen_kounou, null: false, foreign_key: true
      t.string :name
      t.text :introduction
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
