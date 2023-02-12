class CreateKounous < ActiveRecord::Migration[6.1]
  def change
    create_table :kounous do |t|
      t.references :onsen_kounou, null: false, foreign_key: true
      t.string :kounou_name, null: false

      t.timestamps
    end
  end
end
