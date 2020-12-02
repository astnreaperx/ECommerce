class CheckoutController < ApplicationController
    before_action :authenticate_customer!

    def create
        # Create new stripe request

        @cart = Product.find(session[:cart])
        @product = @cart[0]
        if customer_signed_in?
            @customer = Customer.find(current_customer.id)
        end

        @lineitems = []
        @GST = 0
        @PST = 0
        @HST = 0
        @Shipping = 0
        @cart.each do |lineitem|
            @lineitems <<
            {
                name: lineitem.name,
                description: lineitem.description,
                amount: (lineitem.price * 100),
                currency: "cad",
                quantity: 1
            }
            @GST += (lineitem.price * 100) * @customer.province.gst
            @PST += (lineitem.price * 100) * @customer.province.pst
            @HST += (lineitem.price * 100) * @customer.province.hst
            @Shipping += (lineitem.delivery_cost)
        end

        @lineitems <<
        {
            name: "Shipping Information",
            description: @customer.address,
            amount: @Shipping.to_i,
            currency: "cad",
            quantity: 1
        }

        @lineitems <<
        {
            name: "GST",
            description: "GST",
            amount: @GST.to_i,
            currency: "cad",
            quantity: 1
        }
        @lineitems <<
        {
            name: "PST",
            description: "PST",
            amount: @PST.to_i,
            currency: "cad",
            quantity: 1
        }
        @lineitems <<
        {
            name: "HST",
            description: "PST",
            amount: @PST.to_i,
            currency: "cad",
            quantity: 1
        }


        if @cart.nil?
            redirect_to root_path
            nil
            return
        else

        end

        @session = Stripe::Checkout::Session.create(
        payment_method_types: ["card"],
        success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: checkout_cancel_url,
        :metadata => {
            :region => params[:region]
          },
        line_items:  @lineitems
        )

        respond_to do |f|
            f.js
        end
    end

    def success
        @cust = Customer.find(current_customer.id)
        @session = Stripe::Checkout::Session.retrieve(params[:session_id])
        @orderid = Stripe::Checkout::Session.retrieve(@session.id)

        @order = @cust.orders.create(
            payed: true,
            payment_id: @orderid[:id],
            address: @cust.address
        )
        @order.products = @cart

    end

    def cancel
        # Stripe payment was not successful
    end
end
