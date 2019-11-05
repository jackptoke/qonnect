class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :job_bookings, :address_id, :location_id
  end
end
