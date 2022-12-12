class CreateNominees < ActiveRecord::Migration[7.0]
  def change
    create_table :nominees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact
      t.integer :gender
      t.integer :relation
      t.references :address, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
