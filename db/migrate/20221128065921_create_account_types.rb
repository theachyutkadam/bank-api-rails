# frozen_string_literal: true

class CreateAccountTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :account_types, id: :uuid do |t|
      t.string :title, null: false, index: { unique: true }
      t.float :loan_intrest_rate, null: false
      t.float :saving_intrest_rate, null: false

      t.timestamps
    end
  end
end
