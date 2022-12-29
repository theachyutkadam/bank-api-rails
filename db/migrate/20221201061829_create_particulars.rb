class CreateParticulars < ActiveRecord::Migration[7.0]
  def change
    create_table :particulars do |t|
      t.references :card, null: false, foreign_key: true
      t.float :amount, null: false
      t.text :description, null: true
      t.references :sender, null: false, foreign_key: { to_table: :user_informations }
      t.references :receiver, null: false, foreign_key: { to_table: :user_informations }

      t.timestamps
    end
  end
end
