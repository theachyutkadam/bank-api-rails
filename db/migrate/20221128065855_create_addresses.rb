class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :building
      t.string :flat_number
      t.string :street
      t.string :pin_code
      t.text :description
      t.integer :addressable_id, null: false
      t.string :addressable_type, null: false

      t.timestamps
    end
  end
end
