class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.references :user, foreign_key: true
      t.references :request, foreign_key: true
      t.text :content
      t.boolean :finish, null: false, default: false

      t.timestamps
    end
  end
end
