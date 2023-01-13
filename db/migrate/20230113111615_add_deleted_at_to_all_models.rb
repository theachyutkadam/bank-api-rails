class AddDeletedAtToAllModels < ActiveRecord::Migration[7.0]
  def change
    add_column :account_types, :deleted_at, :datetime
    add_index :account_types, :deleted_at

    add_column :departments, :deleted_at, :datetime
    add_index :departments, :deleted_at

    add_column :managers, :deleted_at, :datetime
    add_index :managers, :deleted_at

    add_column :employees, :deleted_at, :datetime
    add_index :employees, :deleted_at

    add_column :nominees, :deleted_at, :datetime
    add_index :nominees, :deleted_at

    add_column :addresses, :deleted_at, :datetime
    add_index :addresses, :deleted_at

    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_column :user_informations, :deleted_at, :datetime
    add_index :user_informations, :deleted_at

    add_column :customers, :deleted_at, :datetime
    add_index :customers, :deleted_at

    add_column :cards, :deleted_at, :datetime
    add_index :cards, :deleted_at

    add_column :salaries, :deleted_at, :datetime
    add_index :salaries, :deleted_at

    add_column :particulars, :deleted_at, :datetime
    add_index :particulars, :deleted_at
  end
end
