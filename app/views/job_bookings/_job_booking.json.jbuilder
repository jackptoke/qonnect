json.extract! job_booking, :id, :appointment_time, :booking_length, :booking_title, :booking_description, :further_instruction, :contact_person, :contact_no, :number_of_interpreter, :job_status, :cost, :payment_status, :payment_reference, :client_id, :address_id, :created_at, :updated_at
json.url job_booking_url(job_booking, format: :json)
