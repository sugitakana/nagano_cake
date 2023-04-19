class Order < ApplicationRecord

  has_many :order_details
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum status: { wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4 }


  validates :shipping_fee, presence: true
  validates :amount_billed, presence: true
  validates :payment_method, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :status, presence: true
end
