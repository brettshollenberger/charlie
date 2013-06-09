class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :subject, :null => false
      t.text :description, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
