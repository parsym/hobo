class AddQuantityToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :quantity, :integer, default: 1
  end
end
