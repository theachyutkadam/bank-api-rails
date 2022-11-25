class CreateTransactionUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_users do |t|
      t.references :transaction, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
