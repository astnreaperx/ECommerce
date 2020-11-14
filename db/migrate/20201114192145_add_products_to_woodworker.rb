class AddProductsToWoodworker < ActiveRecord::Migration[6.0]
  def change
    add_reference :woodworkers, :products, null: false, foreign_key: true
  end
end
