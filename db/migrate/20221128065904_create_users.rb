# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username, null: false, index: { unique: true }
      t.string :password, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :token, default: nil, index: { unique: true }
      t.integer :status, null: false, default: 0
      t.boolean :is_admin, null: false, default: false
      t.timestamp :active_at
      t.timestamp :inactive_at
      t.timestamp :blocked_at

      t.timestamps
    end
  end
end
