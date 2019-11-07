class JobBooking < ApplicationRecord
  belongs_to :client
  belongs_to :location
  belongs_to :dialect
  has_many :booked_interpreters, autosave: true
  has_many :available_interpreters
  enum payment_status: { UNPAID: 0, PENDING: 1, FAILED: 2, PAID: 3, REIMBURSED: 4 }
  enum job_status: { UNASSIGNED: 0, PARTIALLY_ASSIGNED: 1, ASSIGNED: 2, RETURNED: 3, CANCELED: 4, COMPLETED: 5 }

  validates :appointment_time, :booking_length, :booking_title,:booking_description, :contact_person, :contact_no, :number_of_interpreter, :location_id, presence: true
  
  validates :booking_length, numericality: { only_integer: true, greater_than_or_equal_to: 90, message: "Must be greater than or equal to 90 minutes"}
  validates :contact_no, format: {
    with: /[0][2-9][0-9]{8}/,
    message: "Contact number starts with '0' and a length of 10 digits"
  }
end
