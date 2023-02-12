class CreateOnsenSenshitus < ActiveRecord::Migration[6.1]
  def change
    create_table :onsen_senshitus do |t|
      t.references :onsen, null: false, foreign_key: true
      t.references :senshitu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
