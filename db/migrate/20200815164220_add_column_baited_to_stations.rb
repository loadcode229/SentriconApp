class AddColumnBaitedToStations < ActiveRecord::Migration[6.0]
  def change
    add_column :stations, :baited, :boolean
  end
end
