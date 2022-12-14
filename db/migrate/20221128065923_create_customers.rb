class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.references :account_type, null: false, foreign_key: true
      t.bigint :account_number, null: false
      t.integer :amount_limit, null: false
      t.float :current_balance, default: 0, null: false

      t.timestamps
    end
  end
end
