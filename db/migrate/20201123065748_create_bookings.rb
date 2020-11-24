class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :status
      t.integer :total_price
      t.datetime :start_date
      t.datetime :end_date
      t.references :customer, null: false, index: true, foreign_key: { to_table: :users }
      t.references :galaxy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
