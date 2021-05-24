class Transaction < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer
  belongs_to :book

  def price
    transaction.cost = book.cost
  end
end
