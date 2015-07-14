class StripeController < ApplicationController
  include StripeConcerns
  # protect_from_forgery with: :null_session
  protect_from_forgery except: :create
  before_action :authorize_stripe, only: [:create, :update, :delete]

  def new
    render :new
  end

  def create
    current_user.update_attributes(stripe_customer_id: new_stripe['id'], 
                                   stripe_subscription_id: new_stripe['subscriptions']['data'][0]['id'])
    redirect_to '/'
  end

  def new_stripe
    Stripe.stripe_new_user_data(params)
  end

  def edit
    render :edit
  end

  def update
    # delete
    # create
  end

  def delete
    # retrieves customer data by their customer id and deletes their subscription
    customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete

    # deletes card information
    customer.delete

    current_user.stripe_customer_id = nil
    current_user.stripe_subscription_id = nil
    current_user.save

    p "delete ran"

    redirect_to '/'
  end

end
