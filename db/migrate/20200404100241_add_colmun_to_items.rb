class AddColmunToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :brand_id, :integer
    add_column :items, :item_condition_id, :integer, null: false
    add_column :items, :postage_payer_id, :integer, null: false
    add_column :items, :size_id, :integer, null: false
    add_column :items, :preparation_day_id, :integer, null: false
    add_column :items, :postage_type_id, :integer, null: false
    add_column :items, :seller_id, :integer, null: false
    add_column :items, :buyer_id, :integer
  end
end
