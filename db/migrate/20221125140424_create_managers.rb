class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.string :designation
      t.boolean :is_active

      t.timestamps
    end
  end
end
