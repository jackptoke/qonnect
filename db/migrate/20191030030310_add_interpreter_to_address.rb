class AddInterpreterToAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :interpreter, null: false, foreign_key: true
  end
end
