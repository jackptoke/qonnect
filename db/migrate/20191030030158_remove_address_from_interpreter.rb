class RemoveAddressFromInterpreter < ActiveRecord::Migration[6.0]
  def change
    remove_reference :interpreters, :address, null: false, foreign_key: true
  end
end
