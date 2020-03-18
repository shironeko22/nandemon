class AddMoneyToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :money, :integer
  end
end
