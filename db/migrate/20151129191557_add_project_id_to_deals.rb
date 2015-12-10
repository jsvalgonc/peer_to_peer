class AddProjectIdToDeals < ActiveRecord::Migration
  def change
    add_reference :deals, :project, index: true, foreign_key: true
  end
end
