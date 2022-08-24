class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.boolean :delivered
      t.datetime :delivery_date
      t.float :total_cost
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
