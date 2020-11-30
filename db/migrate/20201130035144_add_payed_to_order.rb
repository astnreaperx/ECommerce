class AddPayedToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :payed, :boolean
  end
end
