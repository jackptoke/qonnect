class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.references :client, null: false, foreign_key: true
      t.string :building_info
      t.string :street_address
      t.string :suburb
      t.integer :state
      t.string :postcode
      t.boolean :is_billing_address

      t.timestamps
    end
  end
end
