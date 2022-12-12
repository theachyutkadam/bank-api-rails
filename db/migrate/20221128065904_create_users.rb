class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.integer :status
      t.boolean :is_admin
      t.datetime :deleted_at
      t.integer :accountable_id
      t.string :accountable_type

      t.timestamps
    end
  end
end
