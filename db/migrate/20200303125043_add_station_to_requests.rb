class AddStationToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :station, :string
  end
end
