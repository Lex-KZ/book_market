class Transaction < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :book

  def price
    transaction.cost = book.cost
  end


end
