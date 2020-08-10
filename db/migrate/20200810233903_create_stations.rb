class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.integer :station_number
      t.boolean :activity
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :accounts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
