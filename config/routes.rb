# frozen_string_literal: true

Rails.application.routes.draw do
  root "pages#main"
  get "/payment_requests", to: "pages#payment_requests"
  get "/payment_requests_by_status", to: "pages#payment_requests_by_status"
  patch "/update_payment_request_status", to: "pages#update_payment_request_status"
  patch "/collected", to: "pages#collected"

end
