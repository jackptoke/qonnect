class AvailableInterpreter < ApplicationRecord
  belongs_to :interpreter
  belongs_to :job_booking
end
