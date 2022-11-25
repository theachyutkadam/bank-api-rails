class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :building
      t.string :flat_number
      t.string :road
      t.string :taluka
      t.string :district
      t.string :state

      t.timestamps
    end
  end
end
