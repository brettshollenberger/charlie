class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :byord
      t.string :location
      t.string :spotter

      t.timestamps
    end
  end
end
