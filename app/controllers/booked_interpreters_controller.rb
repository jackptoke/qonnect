class BookedInterpretersController < ApplicationController
  before_action :set_booked_interpreter, only: [:show, :edit, :update, :destroy]

  # GET /booked_interpreters
  def index
    @booked_interpreters = BookedInterpreter.all
  end

  # GET /booked_interpreters/1
  def show
  end

  # GET /booked_interpreters/new
  def new
    @booked_interpreter = BookedInterpreter.new
  end

  # GET /booked_interpreters/1/edit
  def edit
  end

  def book
    success = false
    ActiveRecord::Base.transaction do
      #Book the interpreter
      @booked_interpreter = BookedInterpreter.new(params.permit(:job_booking_id, :interpreter_id))
      @booked_interpreter.save

      #remove the interpreter from the available list
      AvailableInterpreter.find_by(job_booking_id: @booked_interpreter.job_booking_id, interpreter_id: @booked_interpreter.interpreter_id).delete

      #count the number of interpreter being booked already
      count_interpreter = BookedInterpreter.where(job_booking_id: @booked_interpreter.job_booking_id).count
      #get the number of interpreter that is needed
      interpreter_needed = @booked_interpreter.job_booking.number_of_interpreter

      #if enough interpreter(s) been booked
      #update the status of the job_booking accordingly
      if count_interpreter == interpreter_needed
        #update the status to ASSIGNED
        @booked_interpreter.job_booking.job_status = 2

      #if still more interpreter is needed
      elsif count_interpreter > 0 && count_interpreter < interpreter_needed
        #update the status to PARTIALLY_ASSIGNED
        @booked_interpreter.job_booking.job_status = 1
      end
      
      #save the change
      @booked_interpreter.job_booking.save
      success = true
    end
    if  success 
      redirect_to job_bookings_path, notice: 'Booked interpreter was successfully created.'
    else
      render :new
    end
  end

  # POST /booked_interpreters
  def create
    
    @booked_interpreter = BookedInterpreter.new(booked_interpreter_params)

    if @booked_interpreter.save
      redirect_to @booked_interpreter, notice: 'Booked interpreter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /booked_interpreters/1
  def update
    if @booked_interpreter.update(booked_interpreter_params)
      redirect_to @booked_interpreter, notice: 'Booked interpreter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /booked_interpreters/1
  def destroy
    @booked_interpreter.destroy
    redirect_to booked_interpreters_url, notice: 'Booked interpreter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booked_interpreter
      @booked_interpreter = BookedInterpreter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booked_interpreter_params
      params.require(:booked_interpreter).permit(:job_booking_id, :interpreter_id, :time_interpreter_arrived, :time_interpreter_started, :time_interpreter_finished, :interpreter_remark)
    end
end
