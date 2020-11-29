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
        @cart.each do |lineitem|
            @lineitems <<
            {
                name: lineitem.name,
                description: lineitem.description,
                amount: (lineitem.price * 100),
                currency: "cad",
                quantity: 1
            }
            @GST += (lineitem.price * 100) * 0.05
            @PST += (lineitem.price * 100) * @customer.province.tax_rate
        end

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


        if @product.nil?
            redirect_to root_path
            nil
            return
        end

        @session = Stripe::Checkout::Session.create(
        payment_method_types: ["card"],
        line_items: @lineitems,
        success_url: checkout_success_url,
        cancel_url: checkout_cancel_url,
        )

        respond_to do |f|
            f.js
        end
    end

    def success
        # The payment was successful
    end

    def cancel
        # Stripe payment was not successful
    end
end
