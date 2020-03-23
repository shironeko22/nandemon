class AddPaymentToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :payment, :boolean, default: false, null: false
  end
end
