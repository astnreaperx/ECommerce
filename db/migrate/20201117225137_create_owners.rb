class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :website_name
      t.string :owner_name
      t.string :website_description

      t.timestamps
    end
  end
end
