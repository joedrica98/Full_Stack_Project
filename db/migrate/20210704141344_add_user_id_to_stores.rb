class AddUserIdToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :user_id, :int
  end
end
