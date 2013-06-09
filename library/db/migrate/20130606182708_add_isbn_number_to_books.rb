class AddIsbnNumberToBooks < ActiveRecord::Migration
  def change
    add_column :books, :isbn_number, :integer
  end
end
