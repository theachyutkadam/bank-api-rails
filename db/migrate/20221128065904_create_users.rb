class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :email, null: false
      t.integer :status, null: false
      t.boolean :is_admin, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
