class CreateWoodworkers < ActiveRecord::Migration[6.0]
  def change
    create_table :woodworkers do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :shop_name
      t.string :address

      t.timestamps
    end
  end
end
