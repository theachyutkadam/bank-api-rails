class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.bigint :number
      t.datetime :expire_date
      t.integer :csv
      t.references :customer, null: false, foreign_key: true
      t.boolean :is_active
      t.boolean :is_deleted
      t.integer :pin

      t.timestamps
    end
  end
end
