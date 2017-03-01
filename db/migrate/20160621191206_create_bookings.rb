class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :room_information, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :discount, default: 0
      t.decimal :total_amount, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
