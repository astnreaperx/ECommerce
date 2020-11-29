class RemoveProvinceFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :province, null: false, foreign_key: true
  end
end
