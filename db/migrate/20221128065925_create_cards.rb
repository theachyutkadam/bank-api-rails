class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.bigint :number, null: false
      t.datetime :expire_date, null: false
      t.integer :csv, null: false
      t.references :customer, null: false, foreign_key: true
      t.integer :status, null: false
      t.boolean :is_deleted
      t.integer :pin, null: false

      t.timestamps
    end
  end
end
