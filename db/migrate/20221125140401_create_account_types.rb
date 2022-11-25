class CreateAccountTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :account_types do |t|
      t.string :title
      t.float :loan_intrest_rate
      t.float :saving_intrest_rate

      t.timestamps
    end
  end
end
