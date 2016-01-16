class AddInterestRateToProject < ActiveRecord::Migration
  def change
    add_column :projects, :interest_rate, :double
  end
end
