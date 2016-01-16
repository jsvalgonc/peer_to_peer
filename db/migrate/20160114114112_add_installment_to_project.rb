class AddInstallmentToProject < ActiveRecord::Migration
  def change
    add_column :projects, :installment, :double
  end
end
