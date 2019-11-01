class AddContactNameToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :contact_name, :string
    add_column :clients, :organisation_name, :string
    add_column :clients, :acn, :string
    add_column :clients, :mobile_no, :string
    add_column :clients, :telephone_no, :string
  end
end
