class AddAgreementToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :agreement, :boolean, default: false, null: false
  end
end
