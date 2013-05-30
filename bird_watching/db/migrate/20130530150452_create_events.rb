class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :bird
      t.string :location
      t.string :spotter

      t.timestamps
    end
  end
end
