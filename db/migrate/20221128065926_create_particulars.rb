class CreateParticulars < ActiveRecord::Migration[7.0]
  def change
    create_table :particulars do |t|
      t.references :card, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.float :debit_amount
      t.float :credit_amount
      t.float :current_balance

      t.timestamps
    end
  end
end
