class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.references :employee, null: false, foreign_key: true
      t.float :amount, null: false
      t.integer :status, null: false
      t.text :description, null: true
      t.references :particular, null: false, foreign_key: true

      t.timestamps
    end
  end
end
