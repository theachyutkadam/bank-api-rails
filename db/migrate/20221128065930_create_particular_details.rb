class CreateParticularDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :particular_details do |t|
      t.references :particular, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
