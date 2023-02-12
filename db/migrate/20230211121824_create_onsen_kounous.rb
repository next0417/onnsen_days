class CreateOnsenKounous < ActiveRecord::Migration[6.1]
  def change
    create_table :onsen_kounous do |t|
      t.references :onsen, null: false, foreign_key: true
      t.references :kounou, null: false, foreign_key: true

      t.timestamps
    end
  end
end
