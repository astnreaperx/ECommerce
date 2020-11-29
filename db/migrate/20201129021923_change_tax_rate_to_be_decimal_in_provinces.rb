class ChangeTaxRateToBeDecimalInProvinces < ActiveRecord::Migration[6.0]
  def change
      change_column :provinces, :tax_rate, :decimal ,precision: 5, scale: 2

  end
end
