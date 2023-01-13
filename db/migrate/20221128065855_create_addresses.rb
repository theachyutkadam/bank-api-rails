class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :building
      t.string :flat_number
      t.string :street
      t.string :pin_code
      t.text :description
      t.references :addressable, type: :uuid, polymorphic: true
      # t.integer :addressable_id, type: :uuid, null: false
      # t.string :addressable_type, null: false

      t.timestamps
    end
  end
end
