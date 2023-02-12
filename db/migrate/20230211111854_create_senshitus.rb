class CreateSenshitus < ActiveRecord::Migration[6.1]
  def change
    create_table :senshitus do |t|
      t.references :onsen_senshitu, null: false, foreign_key: true
      t.string :senshitu_name, null: false

      t.timestamps
    end
  end
end
