class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.references :account_type, null: false, foreign_key: true
      t.bigint :account_number
      t.integer :amount_limit
      t.float :current_balance

      t.timestamps
    end
  end
end
