class CreateSystemUsages < ActiveRecord::Migration
  def change
    create_table :system_usages do |t|
      t.integer :free_bikes
      t.integer :used_bikes
      t.integer :minute_created

      t.timestamps null: false
    end
  end
end
