class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :title, null: false
      t.bigint :number, null: false
      t.datetime :expire_date, null: false
      t.integer :csv, null: false
      t.references :customer, type: :uuid, null: false, foreign_key: true
      t.integer :status, null: false, default: 1
      t.timestamp :active_at
      t.timestamp :inactive_at
      t.timestamp :blocked_at
      t.timestamp :closed_at
      t.boolean :is_deleted
      t.integer :pin, null: false

      t.timestamps
    end
  end
end
