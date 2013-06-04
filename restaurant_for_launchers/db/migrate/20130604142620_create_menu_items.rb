class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.integer :price_in_cents

      t.timestamps
    end
  end
end
