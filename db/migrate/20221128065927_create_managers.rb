# frozen_string_literal: true

class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true, index: { unique: true }
      t.references :department, type: :uuid, null: false, foreign_key: true
      t.integer :designation, null: false
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
