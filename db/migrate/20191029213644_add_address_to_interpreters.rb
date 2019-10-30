class AddAddressToInterpreters < ActiveRecord::Migration[6.0]
  def change
    add_reference :interpreters, :address, null: false, foreign_key: true
  end
end
