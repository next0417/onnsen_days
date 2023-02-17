class CreateOnsens < ActiveRecord::Migration[6.1]
  def change
    create_table :onsens do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.integer :is_active, default: 0

      t.timestamps
    end
  end
end
