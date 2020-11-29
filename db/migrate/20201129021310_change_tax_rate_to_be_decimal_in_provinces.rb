class ChangeTaxRateToBeDecimalInProvinces < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :provinces, :tax_rate, :integer
    end

    def down
      change_column :provinces, :tax_rate, :integer{5,2}
    end
  end
end
