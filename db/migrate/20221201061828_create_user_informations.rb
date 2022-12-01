class CreateUserInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_informations do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact
      t.integer :gender
      t.datetime :birth_date
      t.string :pan_card_number
      t.string :adhaar_card_number
      t.boolean :is_handicap
      t.text :handicap_details
      t.integer :maritial_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
