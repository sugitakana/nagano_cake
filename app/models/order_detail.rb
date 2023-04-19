class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum production_status: { impossible_manufacture: 0,  waiting_manufacture: 1, manufacturing: 2, finish: 3 }

  def subtotal
    item.with_tax_price * quantity
  end

  validates :price, presence: true
  validates :quantity, presence: true
  validates :production_status, presence: true
end
