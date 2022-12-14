class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :building
      t.string :flat_number
      t.string :street
      t.string :pin_code
      t.text :description
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
