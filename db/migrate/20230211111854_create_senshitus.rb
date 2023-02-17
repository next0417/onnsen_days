class CreateSenshitus < ActiveRecord::Migration[6.1]
  def change
    create_table :senshitus do |t|
      t.string :senshitu_name, null: false

      t.timestamps
    end
  end
end
