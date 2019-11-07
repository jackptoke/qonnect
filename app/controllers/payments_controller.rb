class PaymentsController < ApplicationController
    before_action :authenticate_client!
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success
        @amount = params[:amount]
        @client = params[:client_id]
        @job_booking = JobBooking.find(params[:job_booking_id])
        @job_booking.payment_status = 3
        @job_booking.payment_reference = params[:reference_no]

        if @job_booking.save
            @message = "Job Booking record is successfully updated."
        else
            @message = "Job Booking record update is failed."
        end

    end

    def webhook
        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        job_booking_id = payment.metadata.job_booking_id
        client_id = payment.metadata.client_id

        p "Payment ID: " + payment_id
        p "Job Booking ID: " + job_booking_id
        p "Client ID " + client_id

        status 200
    end
end