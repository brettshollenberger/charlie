class AddColumnSpottedBy < ActiveRecord::Migration
  def change
    add_column :spottings, :spotted_by, :string, :null => false
  end
end
