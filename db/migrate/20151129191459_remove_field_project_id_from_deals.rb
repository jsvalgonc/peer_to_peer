class RemoveFieldProjectIdFromDeals < ActiveRecord::Migration
  def change
    remove_reference :deals, :project_id, index: true, foreign_key: true
  end
end
