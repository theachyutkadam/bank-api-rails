class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.integer :employee_count, default: 0

      t.timestamps
    end
  end
end
