class CreateStoreProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :store_products do |t|
      t.integer :store_id
      t.integer :product_id
    end
  end
end
