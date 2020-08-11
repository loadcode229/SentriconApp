class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.integer :station_number
      t.boolean :activity, default: false

      t.timestamps
    end
  end
end
