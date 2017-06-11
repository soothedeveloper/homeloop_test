class CreateQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :queries do |t|
      t.string :email, null: false, limit: 254
      t.float :latitude, null: false, precision: 10, scale: 6
      t.float :longitude, null: false, precision: 10, scale: 6
      t.integer :result_count, null: false, default: 0

      t.timestamps
    end
  end
end
