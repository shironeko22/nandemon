class AddPrefectureToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :prefecture, :string
  end
end
