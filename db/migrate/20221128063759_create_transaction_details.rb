class CreateTransactionDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_details do |t|
      t.references :transaction, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: { to_table: :customers }
      t.references :receiver, null: false, foreign_key: { to_table: :customers }

      t.timestamps
    end
  end
end
