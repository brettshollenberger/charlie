class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    add_column :issues, :category_id, :integer
    remove_column :issues, :category
  end
end
