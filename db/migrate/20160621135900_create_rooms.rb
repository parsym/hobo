class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.references :room_information, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
