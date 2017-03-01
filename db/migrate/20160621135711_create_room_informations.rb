class CreateRoomInformations < ActiveRecord::Migration
  def change
    create_table :room_informations do |t|
      t.string :room_type
      t.text :description
      t.decimal :price ,precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
