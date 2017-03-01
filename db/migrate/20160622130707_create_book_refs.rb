class CreateBookRefs < ActiveRecord::Migration
  def change
    create_table :book_refs do |t|
      t.references :booking, index: true, foreign_key: true
      t.date :booked_date
      t.references :room_information, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
