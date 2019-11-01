class CreateJobBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :job_bookings do |t|
      t.datetime :appointment_time
      t.integer :booking_length
      t.string :booking_title
      t.text :booking_description
      t.text :further_instruction
      t.string :contact_person
      t.string :contact_no
      t.integer :number_of_interpreter
      t.integer :job_status
      t.decimal :cost
      t.integer :payment_status
      t.string :payment_reference
      t.references :client, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
