class BookedInterpreter < ApplicationRecord
  belongs_to :job_booking
  belongs_to :interpreter
end
