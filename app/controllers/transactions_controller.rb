class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    before_action :set_book, only: %i[create]
    
    def create
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
            price_data: {
                unit_amount: (@book.cost * 100),
                currency: 'aud',
                product_data: {
                    name: @book.title
                },
            },
            quantity: 1,
            }],
            mode: 'payment',
            success_url: checkout_success_url,
            cancel_url: books_url,
        })
        
    
        render json: { id: session.id }
    end

    def success  
    end


    private
        def set_book
            @book = Book.find(params[:id])
        end
end
