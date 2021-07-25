class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :departure, null: false, foreign_key: { to_table: :airports }
      t.references :destination, null: false, foreign_key: { to_table: :airports }
      t.datetime :takeoff
      t.integer :duration

      t.timestamps
    end
  end
end
