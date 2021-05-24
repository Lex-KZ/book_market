class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_many :books

  has_many :sales, class_name: "Transaction", foreign_key: :seller_id
  has_many :sold_books, through: :sales, source: :book

  has_many :purchases, class_name: "Transaction", foreign_key: :buyer_id
  has_many :purchased_books, through: :purchases, source: :book

  scope :sellers, -> { joins(:sales) }
  scope :buyers, -> { joins(:purchases) }
  
  
end
