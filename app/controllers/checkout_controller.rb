class CheckoutController < ApplicationController
    def create
        # Create new stripe request
        @product = Product.find(params[:id])


        if @product.nil?
            redirect_to root_path
            nil
            return
        end

        @session = Stripe::Checkout::Session.create(
        payment_method_types: ["card"],
        line_items:[
            {
            name: @product.name,
            description: @product.description,
            amount: (@product.price * 100  ),
            currency: "cad",
            quantity: 1
            },
            {
                name: "GST",
                description: "Taxes",
                amount: (7),
                currency: "cad",
                quantity: 1
            }
        ],
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
