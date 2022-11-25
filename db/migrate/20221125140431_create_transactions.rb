class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :card, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.float :debit_amount
      t.float :credit_amount

      t.timestamps
    end
  end
end
