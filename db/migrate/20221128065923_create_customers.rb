class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.references :account_type, type: :uuid, null: false, foreign_key: true
      t.bigint :account_number, null: false
      t.integer :amount_limit, null: false
      t.integer :status, null: false, default: 1
      t.float :current_balance, default: 0, null: false

      t.timestamps
    end
  end
end
