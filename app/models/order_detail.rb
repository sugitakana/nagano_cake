class OrderDetail < ApplicationRecord
  
  belongs_to :order
  
  validates :price, presence: true
  validates :quantity, presence: true
  validates :production_status, presence: true
end
