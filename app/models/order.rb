class Order < ApplicationRecord

  has_many :order_details
  belongs_to :customer

  validates :shipping_fee, presence: true
  validates :amount_billed, presence: true
  validates :payment_method, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :status, presence: true
end
