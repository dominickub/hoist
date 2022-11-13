# frozen_string_literal: true

class PagesController < ApplicationController
  def main
    @customers = Customer.all
  end

  def collected
    @payment_request = PaymentRequest.find(params[:customer_id, :id])
    @payment_request.update(status: "collected")
    redirect_to root_path
  end

  def payment_requests
    @payment_requests = PaymentRequest.where(customer_id: params[:customer_id])
    render json: @payment_requests
  end

  #show payment requests by status
  def payment_requests_by_status
    @payment_requests = PaymentRequest.where(status: params[:status])
    render json: @payment_requests
  end

  #show payment requests by customer and statuses
  def payment_requests_by_customer_and_status
    @payment_requests = PaymentRequest.where(customer_id: params[:customer_id], status: params[:status])
    render json: @payment_requests
  end 
  # find the customers with payment requests that are "generated" and change them to "collected" 
  def update_payment_request_status
    #find the payment request through the customer id and id of the payment request
    #if the status of the payment request is "generated", then update it to "collected"
    @payment_request = PaymentRequest.find(params[:customer_id, :id])
    if @payment_request.status == "generated"
      @payment_request.update(status: "collected")
    else
      render json: {error: "Payment request status is not generated"}
    end
  end

end
