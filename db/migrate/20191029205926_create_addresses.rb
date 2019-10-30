class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :suburb
      t.integer :state
      t.string :postcode

      t.timestamps
    end
  end
end
