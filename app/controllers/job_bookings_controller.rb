class JobBookingsController < ApplicationController
  before_action :set_job_booking, only: [:show, :edit, :update, :destroy]

  # GET /job_bookings
  # GET /job_bookings.json
  def index
    @job_bookings = JobBooking.where(client_id: current_client.id)
  end

  # GET /job_bookings/1
  # GET /job_bookings/1.json
  def show
  end

  # GET /job_bookings/new
  def new
    @job_booking = JobBooking.new
  end

  # GET /job_bookings/1/edit
  def edit
  end

  # POST /job_bookings
  # POST /job_bookings.json
  def create
    @job_booking = JobBooking.new(job_booking_params)
    @job_booking.client_id = current_client.id
    @job_booking.job_status = 0
    @job_booking.payment_status = 0
    @job_booking.cost = calculate_cost(@job_booking.booking_length)

    respond_to do |format|
      if @job_booking.save
        format.html { redirect_to @job_booking, notice: 'Job booking was successfully created.' }
        format.json { render :show, status: :created, location: @job_booking }
      else
        format.html { render :new }
        format.json { render json: @job_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_bookings/1
  # PATCH/PUT /job_bookings/1.json
  def update
    respond_to do |format|
      if @job_booking.update(job_booking_params)
        format.html { redirect_to @job_booking, notice: 'Job booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_booking }
      else
        format.html { render :edit }
        format.json { render json: @job_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_bookings/1
  # DELETE /job_bookings/1.json
  def destroy
    @job_booking.destroy
    respond_to do |format|
      format.html { redirect_to job_bookings_url, notice: 'Job booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_booking
      @job_booking = JobBooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_booking_params
      params.require(:job_booking).permit(:appointment_time, :booking_length, :booking_title, :booking_description, :further_instruction, :contact_person, :contact_no, :number_of_interpreter, :job_status, :cost, :payment_status, :payment_reference, :client_id, :address_id, :dialect_id)
    end

    def calculate_cost(time_minutes)
      rate = 80
      overtime = time_minutes - 90
      ot_cost = (overtime/15.0).ceil * (rate/4)
      return (ot_cost + rate)
    end
end
