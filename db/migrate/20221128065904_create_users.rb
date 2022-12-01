class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact
      t.datetime :birth_date
      t.integer :gender
      t.integer :status
      t.boolean :is_admin
      t.boolean :is_deleted
      t.integer :accountable_id
      t.string :accountable_type
      t.string :pan_card_number
      t.string :adhaar_card_number
      t.boolean :is_handicap
      t.text :handicap_details
      t.integer :maritial_status

      t.timestamps
    end
  end
end
