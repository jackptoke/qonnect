class BookedInterpreter < ApplicationRecord
  belongs_to :job_booking, autosave: true
  belongs_to :interpreter
end
