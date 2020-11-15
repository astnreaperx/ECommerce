class AddPasswordToWoodworker < ActiveRecord::Migration[6.0]
  def change
    add_column :woodworkers, :password, :string
  end
end
