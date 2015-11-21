class AddFiscalNumberToInvestors < ActiveRecord::Migration
  def change
    add_column :investors, :fiscal_number, :string
  end
end
