# frozen_string_literal: true

class CreateUserInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_informations, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :middle_name, null: false
      t.string :last_name, null: false
      t.string :contact, null: false, index: { unique: true }
      t.integer :gender, null: false
      t.date :birth_date, null: false
      t.string :pan_card_number, null: false, index: { unique: true }
      t.string :adhaar_card_number, null: false, index: { unique: true }
      t.boolean :is_handicap
      t.text :handicap_details
      t.integer :maritial_status, null: false
      t.references :user, type: :uuid, null: false, foreign_key: true, index: { unique: true }
      t.references :accountable, type: :uuid, polymorphic: true
      # t.integer :accountable_id, type: :uuid
      # t.string :accountable_type

      t.timestamps
    end
  end
end
