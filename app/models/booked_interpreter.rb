class BookedInterpreter < ApplicationRecord
  

  belongs_to :job_booking, autosave: true
  belongs_to :interpreter
  # after_save :update_job_status, on: :finished
  # def update_job_status
  #   job_id = @booked_interpreter.job_booking_id
  
  #   num_unfinished_bookings = BookedInterpreter.where(job_booking_id: job_id, time_interpreter_finished: nil).count

  #   if num_unfinished_bookings == 0
  #     ActiveRecord::Base.transaction do
  #       @booked_interpreter.job_booking.job_status = 5
  #       @booked_interpreter.job_booking.save 
  #     end
  #   end
  # end
end
