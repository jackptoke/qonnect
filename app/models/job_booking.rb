class JobBooking < ApplicationRecord
  belongs_to :client
  belongs_to :address
  belongs_to :dialect
  has_many :booked_interpreters
  has_many :available_interpreters
  enum payment_status: { UNPAID: 0, PENDING: 1, FAILED: 2, PAID: 3, REIMBURSED: 4 }
  enum job_status: { UNASSIGNED: 0, PARTIALLY_ASSIGNED: 1, ASSIGNED: 2, RETURNED: 3, CANCELED: 4, COMPLETED: 5 }
end
