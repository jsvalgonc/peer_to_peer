class RemoveFieldEntrepreneurIdFromDeals < ActiveRecord::Migration
  def change
    remove_reference :deals, :entrepreneur, index: true, foreign_key: true
  end
end
