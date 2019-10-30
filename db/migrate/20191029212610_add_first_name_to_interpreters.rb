class AddFirstNameToInterpreters < ActiveRecord::Migration[6.0]
  def change
    add_column :interpreters, :first_name, :string
    add_column :interpreters, :last_name, :string
    add_column :interpreters, :abn, :string
    add_column :interpreters, :mobile, :string
    add_column :interpreters, :sex, :integer
    add_column :interpreters, :payment_rate, :decimal, default: 75
    add_column :interpreters, :rating_score, :decimal, default: 5
  end
end
