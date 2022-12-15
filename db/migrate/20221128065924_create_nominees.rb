class CreateNominees < ActiveRecord::Migration[7.0]
  def change
    create_table :nominees do |t|
      t.string :first_name, null: false
      t.string :middle_name, null: false
      t.string :last_name, null: false
      t.string :contact, null: false
      t.integer :gender, null: false
      t.integer :relation, null: false
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
