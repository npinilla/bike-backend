class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :empty_slots
      t.integer :free_bikes
      t.datetime :last_updated

      t.timestamps null: false
    end
  end
end
