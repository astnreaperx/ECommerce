class CheckoutController < ApplicationController
    def create
        # Create new stripe request

        @cart = Product.find(session[:cart])
        @product = @cart[0]


        @lineitems = []
        @cart.each do |lineitem|
            @lineitems <<
            {
                name: lineitem.name,
                description: lineitem.description,
                amount: (lineitem.price * 100  ),
                currency: "cad",
                quantity: 1
            }
        end


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
