class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.float :latitude, null: false, precision: 10, scale: 6
      t.float :longitude, null: false, precision: 10, scale: 6
      t.float :price, null: false, default: 0
      t.integer :nb_rooms, null: false, default: 0
      t.integer :square_meters, null: false, default: 0
      t.date :date, null: false

      t.timestamps
    end
  end
end
