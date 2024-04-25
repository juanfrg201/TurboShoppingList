class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.date :purchase_date
      t.string :store_name
      t.references :store_section, null: false, foreign_key: true
      t.boolean :purchased
      t.integer :quantity

      t.timestamps
    end
  end
end
