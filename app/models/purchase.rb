class Purchase < ActiveRecord::Base
  has_many :order_items, through: :purchases
  belongs_to :product
  belongs_to :buyer, class_name: 'User'
end
