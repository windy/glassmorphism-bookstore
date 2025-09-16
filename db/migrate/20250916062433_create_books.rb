class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.decimal :price
      t.string :isbn
      t.string :category
      t.date :published_at
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
