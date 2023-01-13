class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :email, null: false
      t.string :token, default: nil
      t.integer :status, null: false, default: 0
      t.boolean :is_admin, null: false, default: false

      t.timestamps
    end
  end
end
