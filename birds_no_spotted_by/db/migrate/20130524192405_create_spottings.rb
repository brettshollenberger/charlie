class CreateSpottings < ActiveRecord::Migration
  def change
    create_table :spottings do |t|
      t.string :location
      t.string :bird_name

      t.timestamps
    end
  end
end
