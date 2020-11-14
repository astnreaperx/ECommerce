class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :Products, :Woodworker_id, :woodworker_id
  end
end
