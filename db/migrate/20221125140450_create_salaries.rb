class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.references :employee, null: false, foreign_key: true
      t.float :amount
      t.integer :status
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
