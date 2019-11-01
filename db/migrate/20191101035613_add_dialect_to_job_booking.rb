class AddDialectToJobBooking < ActiveRecord::Migration[6.0]
  def change
    add_reference :job_bookings, :dialect, null: false, foreign_key: true
  end
end
