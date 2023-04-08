class OrderDetail < ApplicationRecord
  
  belongs_to :order
  
  enum production_status: { impossible_manufacture: 0,  waiting_manufacture: 1, manufacturing: 2, finish: 3 
  
  validates :price, presence: true
  validates :quantity, presence: true
  validates :production_status, presence: true
end
